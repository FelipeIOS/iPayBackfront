//
//  CadastroController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import Foundation

class CadastroController {
	
	func setCreateUser(email: String, senha: String, completion: @escaping(_ success: Bool) -> Void) {
		
		CadastroWorker().createUser(email: email, senha: senha) { (identifier) in
			if identifier != nil {
				completion(true)
				self.saveUser(email: email, senha: email, identifier: identifier ?? "")
				
			} else {
				completion(false)
			}
		}
		
	}
	
	func saveUser(email: String, senha: String, identifier: String) {
		CadastroWorker().saveUser(email: email, senha: senha, identifier: identifier)
	}
	
}
