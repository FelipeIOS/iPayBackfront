//
//  HistoryController.swift
//  iPayBF
//
//  Created by Felipe Miranda on 15/03/21.
//

import Foundation

protocol HistoryViewModelDelegate: class {
    
    func successLoadHistory(value: Bool)
    func failureLoadHistory(value: NSError?)
}

class HistoryViewModel {
    
    private var history: History?
    private weak var delegate: HistoryViewModelDelegate?
    
    
    init(delegate: HistoryViewModelDelegate?, history: History? = nil) {
        
        self.delegate = delegate
        self.history = history
    }
    

    
    var numberOfRows: Int {
        return history?.historyAccountList.count ?? 0
    }
    
    func loadCurrentHistoryAccount(indexPath: IndexPath) -> ProductCellViewModel? {
        
        let productCellViewModel:ProductCellViewModel? = ProductCellViewModel(value: self.history?.historyAccountList[indexPath.row])
        
        return productCellViewModel
    }
    
    func loadHistory(){
    
        HistoryWorker().loadHistory { (success, error) in
            
            if success != nil {
                self.history = success
                self.delegate?.successLoadHistory(value: true)
            }else{
                self.delegate?.failureLoadHistory(value: error)
            }
        }
    }
}
