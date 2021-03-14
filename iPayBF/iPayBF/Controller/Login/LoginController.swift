//
//  LoginController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import Foundation

class LoginController {
	
	func setLogar(email: String, password: String, completion: @escaping(_ success: Bool) -> Void) {
		print(#function)
		
		LoginWorker().signInFirebase(email: email, senha: password) { (email, error) in
			if email == nil {
				completion(false)
			} else {
				completion(true)
			}
		}
	}
	
	func setSair() {
		LoginWorker().signOutFirebase()
	}
	
	func addStateDidChangeListener(completion: @escaping(_ success: Bool) -> Void) {
		
		LoginWorker().addStateDidChangeListener { (success) in
			completion(success)
		}
	}
	
}
