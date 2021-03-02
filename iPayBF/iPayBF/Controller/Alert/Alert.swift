//
//  Alert.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 27/02/21.
//

import Foundation
import UIKit
import PopupDialog


class Alert {
	let controller: UIViewController
	
	init(controller: UIViewController) {
		self.controller = controller
	}
	
	func showPopup(completion: @escaping() -> Void) {
		
		let title: String = "Aeeee :)"
		let message: String = "Você foi o premiado da vez, entregue seu cartão e faça a boa para seus amigos da mesa. Pague a conta!!"
		let image = UIImage(named: "skeleton")
		let popup: PopupDialog = PopupDialog(title: title, message: message, image: image)
		
		popup.view.backgroundColor = .black
		
		let button = DefaultButton(title: "OK") {
			print("Clicou no OK")
			completion()
		}
		
		button.backgroundColor = UIColor(cgColor: CGColor(red: 75/255.0, green: 162/255.0, blue: 218/255.0, alpha: 1))
		button.tintColor = .white
		
		popup.addButton(button)
		
		self.controller.present(popup, animated: true, completion: nil)
	}
	
	func showAlert(title: String, message: String, typeButton: String) {
		let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let buttonOK = UIAlertAction(title: typeButton, style: .cancel, handler: nil)
		alert.addAction(buttonOK)
		self.controller.present(alert, animated: true, completion: nil)
	}
	
	func detailAlert(title: String, message: String, completion: @escaping() -> Void) {
	
		let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
	
		let buttonOK = UIAlertAction(title: "OK", style: .default) { (code) in
			completion()
		}
		
		alert.addAction(buttonOK)
		
		self.controller.present(alert, animated: true, completion: nil)
		
	}
	
}
