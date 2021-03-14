//
//  LoginViewController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import UIKit

class LoginViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	// MARK: - Variable
	var controller: LoginController = LoginController()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configTextField()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.controller.addStateDidChangeListener { (success) in
			if success {
				self.performSegue(withIdentifier: "segueHome", sender: self)
			}
		}

	}
	
	
	// MARK: - Function
	private func configTextField() {
		self.emailTextField.delegate = self
		self.passwordTextField.delegate = self
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedSignInButton(_ sender: UIButton) {
		let email = self.emailTextField.text ?? ""
		let senha = self.passwordTextField.text ?? ""
		
		self.controller.setLogar(email: email, password: senha) { (success) in
			if success {
				self.performSegue(withIdentifier: "segueHome", sender: self)
			} else {
				print("=== ERRO NO SIGN IN ===")
			}
		}
		
	}
	
	
}


// MARK: - Extension TextField
extension LoginViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
	
}
