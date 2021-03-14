//
//  CadastroWorker.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class CadastroWorker {
	
	func createUser(email: String, senha: String, completion: @escaping(_ identifier: String?) -> Void) {
		
		let autenticacao = Auth.auth()
		
		autenticacao.createUser(withEmail: email, password: senha) { (authResult, error) in
			
			if error == nil {
				
				if authResult == nil {
					print("Result vazio")
					completion(nil)
				} else {
					completion(autenticacao.currentUser?.uid)
				}
				
			} else {
				print("Deu ruim no Create")
				print(error?.localizedDescription)
				completion(nil)
			}
			
		}
		
	}
	
	func saveUser(email: String, senha: String, identifier: String) {
		
		let database = Database.database().reference()
		let usuarios = database.child("usuarios")
		
		let dadosUsuario = [
			"email": email,
			"senha": senha
		]
		
		usuarios.child(identifier).setValue(dadosUsuario)
		
		print("Sucesso ao Salvar no Database")
	}
	
}
