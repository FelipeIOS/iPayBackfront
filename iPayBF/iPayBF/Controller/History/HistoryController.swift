//
//  HistoryController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 15/03/21.
//

import Foundation

class HistoryController {
	
	// MARK: - Variable
	private var history: History?
	
	var numberOfRows: Int {
		return (history?.historyAccountList.count ?? 0) + 1
	}
	
	
	// MARK: - Function
	func loadCurrentHistoryAccount(indexPath: IndexPath) -> HistoryAccountList? {
		return self.history?.historyAccountList[indexPath.row]
	}
	
	func loadHistory(completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
		
		HistoryWorker().loadHistory { (history, error) in
			if history == nil {
				completion(false, nil)
			} else {
				self.history = history
				completion(true, nil)
			}
		}
		
	}
	
	func checkIfLastIndex(indexPath: IndexPath) -> Bool {
		if indexPath.row == self.history?.historyAccountList.count ?? 0 {
			return true
		} else {
			return false
		}
	}
	
	func getTotalValue() -> Float {
		return Float(self.history?.totalValue ?? 0.0)
	}
	
	
}
