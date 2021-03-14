//
//  LoginWorker.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import Foundation
import FirebaseAuth

class LoginWorker {
	
	func signInFirebase(email: String, senha: String, completion: @escaping(_ email: String?, _ error: NSError?) -> Void) {
		
		let autenticacao = Auth.auth()
		autenticacao.signIn(withEmail: email, password: senha) { (authResult, error) in
			
			if error != nil {
				print("Deu ruim no signIn")
				print(error?.localizedDescription)
			} else {
				
				if autenticacao.currentUser?.uid != "" {
					print("== Sucesso ==")
					completion(autenticacao.currentUser?.email, nil)
				} else {
					print("== Ruim ==")
					completion(nil, NSError())
				}
				
			}
			
		}
		
	}
	
	func signOutFirebase() {
		do {
			try Auth.auth().signOut()
			print("== Log Out ==")
			
		} catch {
			print("== DEU RUIM ==")
		}
	}
	
	func addStateDidChangeListener(completion: @escaping(_ success: Bool) -> Void) {
		Auth.auth().addStateDidChangeListener { (auth, user) in
			if user == nil {
				completion(false)
			} else {
				completion(true)
			}
		}
	}
	
}
