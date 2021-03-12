//
//  AccountController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 08/03/21.
//

import Foundation
import Alamofire

class AccountController {
	
	private var account: Account?
	
	
	// MARK: - Function
	
	func addAccount(account: Account?) {
		self.account = account
	}
	
	func getCount() -> Int {
		return (self.account?.productList.count ?? 0) + 1
	}
	
	func checkIfLastIndex(indexPath: IndexPath) -> Bool {
		if indexPath.row == self.account?.productList.count ?? 0 {
			return true
		} else {
			return false
		}
	}
	
	func getProduct(at: Int) -> ProductList? {
		return self.account?.productList[at]
	}
	
	func getTotal() -> Float {
		let _total: Float = Float(self.account?.totalValue ?? 0)
		return _total
	}
	
	func loadAccount(completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
		
		AccountWorker().loadAccount { (conta, error) in
			if conta == nil {
				completion(false, nil)
			} else {
				self.addAccount(account: conta)
				completion(true, nil)
			}
		}
		
	}
	
	func loadAccountMock(completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
		
		AccountWorker().loadAccountMock { (conta, error) in
			if conta == nil {
				completion(false, error)
			} else {
				self.addAccount(account: conta)
				completion(true, nil)
			}
		}
		
	}
	
}
