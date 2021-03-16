//
//  HistoryNetwork.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 15/03/21.
//

import Foundation
import Alamofire

class HistoryWorker {
	
	// MARK: - Function
	
	func loadHistory(completion: @escaping(_ success: History?, _ error: NSError?) -> Void) {
		// URL Base String
		let urlString: String = "https://run.mocky.io/v3/787f09d0-bdc1-4bfe-8696-a4048276c91b"
		
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
					let history: History = try History(data: data)
					completion(history, nil)
				} catch {
					print("Erro no Accout")
					completion(nil, error as NSError)
				}
				
			} else {
				completion(nil, NSError())
			}
			
		}
		
	}
	
	
}
