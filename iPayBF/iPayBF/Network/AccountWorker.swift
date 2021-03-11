//
//  AccountWorker.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 11/03/21.
//

import Foundation
import Alamofire

class AccountWorker {
	
//	func loadAccount(completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
//		// URL Base String
//		let urlString: String = "https://run.mocky.io/v3/82375610-cc6d-4261-9581-7ec9f0ee1fbe"
//		
//		// URL Base URL
//		guard let url: URL = URL(string: urlString) else { return }
//		
//		// URL Request
//		var urlRequest: URLRequest = URLRequest(url: url)
//		
//		// Configuração do URL Request
//		urlRequest.httpMethod = "GET"
//		urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//		
//		// Chamada de Request
//		AF.request(urlRequest).responseJSON { (response) in
//			
//			// Validação de Status
//			if response.response?.statusCode == 200 {
//				guard let data = response.data else { return }
//				
//				do {
//					
//					let account: Account = try Account(data: data)
//					self.addAccount(account: account)
//					completion(true, nil)
//				} catch {
//					print("Erro no Accout")
//					completion(false, error as NSError)
//				}
//				
//			} else {
//				completion(false, NSError())
//			}
//			
//		}
//	
//	}
	
	func loadAccountMock(completion: @escaping(_ account: Account, _ error: NSError?) -> Void) {
		
//		if let path = Bundle.main.path(forResource: "Account", ofType: "json") {
//			
//			do {
//				
//				let data = try Data(contentsOf: URL(fileURLWithPath: path),
//										  options: .mappedIfSafe)
//				
//				let account: Account = try Account(data: data)
//				
//				completion(account)
//				
//			} catch {
//				print(error)
//			}
//			
//		}

	}
	
}
