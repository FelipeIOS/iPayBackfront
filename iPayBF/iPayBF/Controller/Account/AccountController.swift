//
//  AccountController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 08/03/21.
//

import Foundation

class AccountController {
	
	func loadAccount(completion: @escaping(_ account: Account) -> Void) {
		
		
	
	}
	
	func loadAccountMock(completion: @escaping(_ account: Account) -> Void) {
		
		if let path = Bundle.main.path(forResource: "Account", ofType: "json") {
			
			do {
				
				let data = try Data(contentsOf: URL(fileURLWithPath: path),
										  options: .mappedIfSafe)
				
				let account: Account = try Account(data: data)
				
				completion(account)
				
			} catch {
				print(error)
			}
			
		}

	}
	
}
