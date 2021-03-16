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
		return history?.historyAccountList.count ?? 0
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
	
	
}
