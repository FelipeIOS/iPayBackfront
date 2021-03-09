//
//  AccountController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 08/03/21.
//

import Foundation
import Alamofire

class AccountController {
	
	func loadAccount(completion: @escaping(_ account: Account) -> Void) {
		let urlString: String = "https://run.mocky.io/v3/82375610-cc6d-4261-9581-7ec9f0ee1fbe"
		guard let url: URL = URL(string: urlString) else { return }
		var urlRequest: URLRequest = URLRequest(url: url)
		
		// Configuração do URL Request
		urlRequest.httpMethod = "GET"
		urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
		
		// Chamada de Request
		AF.request(urlRequest).responseJSON { (response) in
			
			print("Response.Response: \(String(describing: response.response))")
			print("Response.Result: \(response.result)")
			
			guard let data = response.data else { return }
			
			do {

				let account: Account = try Account(data: data)
				let productList: [ProductList] = account.productList
				
				completion(account)
				
				print("Product List: \(account.productList)")
				print("Lista Produto: \(productList)")
				
				for product in productList {
					print(product.productID)
					print(product.productType)
					print(product.name)
					print(product.price)
					print(product.quantity)
				}
				
				print("Total: \(account.totalValue)")
				
			} catch {
				print("Erro no Accout")
				print(error)
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
