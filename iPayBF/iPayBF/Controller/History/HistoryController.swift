//
//  HistoryController.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 15/03/21.
//

import UIKit

class HistoryController {

    private var history: History?

    var numberOfRows: Int {
        return history?.historyAccountList.count ?? 0
    }
    
    func loadCurrentHistoryAccount(indexPath: IndexPath) -> HistoryAccountList? {
        return self.history?.historyAccountList[indexPath.row]
    }
    
    func loadHistory(completion:@escaping(_ success: Bool, _ error: NSError?) -> Void){
    
        HistoryWorker().loadHistory { (success, error) in
            
            if success != nil {
                self.history = success
                completion(true, nil)
            }else{
                completion(false, error)
            }
        }
    }
    
}
