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
	
	func addAccount(account: Account) {
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
		// URL Base String
		let urlString: String = "https://run.mocky.io/v3/82375610-cc6d-4261-9581-7ec9f0ee1fbe"
		
		// URL Base URL
		guard let url: URL = URL(string: urlString) else { return }
		
		// URL Request
		var urlRequest: URLRequest = URLRequest(url: url)
		
		// Configuração do URL Request
		urlRequest.httpMethod = "GET"
		urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
		
		// Chamada de Request
		AF.request(urlRequest).responseJSON { (response) in
			
			// Validação de Status
			if response.response?.statusCode == 200 {
				guard let data = response.data else { return }
				
				do {
					
					let account: Account = try Account(data: data)
					self.addAccount(account: account)
					completion(true, nil)
				} catch {
					print("Erro no Accout")
					completion(false, error as NSError)
				}
				
			} else {
				completion(false, NSError())
			}
			
		}
	
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
