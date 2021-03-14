//
//  CadastroViewController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 14/03/21.
//

import UIKit

class CadastroViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	// MARK: - Variable
	var controller: CadastroController = CadastroController()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configTextField()
	}
	
	
	// MARK: - Function
	private func configTextField() {
		self.emailTextField.delegate = self
		self.passwordTextField.delegate = self
	}
	
	
	// MARK: - IBACtion
	@IBAction func tappedCadastrarButton(_ sender: UIButton) {
		let email = emailTextField.text ?? ""
		let senha = passwordTextField.text ?? ""
		
		self.controller.setCreateUser(email: email, senha: senha) { (success) in
			if success {
				self.dismiss(animated: true, completion: nil)
			} else {
				print("== DEU RUIM ==")
			}
		}
		
	}
	
}


// MARK: - Extension TextField
extension CadastroViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
	
}
