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
    private var delegate: HistoryViewModelDelegate?
    private var currentHistoryAccountList: HistoryAccountList?
    
    init(delegate: HistoryViewModelDelegate?, history: History? = nil) {
        
        self.delegate = delegate
        self.history = history
    }
    
    var name: String {
        return self.currentHistoryAccountList?.name ?? ""
    }
    
    var price: String {
        return String(format: "R$ %.2f", self.currentHistoryAccountList?.price ?? 0)
    }
    
    var numberOfRows: Int {
        return history?.historyAccountList.count ?? 0
    }
    
    func loadCurrentHistoryAccount(indexPath: IndexPath) {
        
        self.currentHistoryAccountList = self.history?.historyAccountList[indexPath.row]
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
