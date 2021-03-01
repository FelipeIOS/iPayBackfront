//
//  Alert.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 27/02/21.
//

import Foundation
import UIKit


class Alert {
	let controller: UIViewController
	
	init(controller: UIViewController) {
		self.controller = controller
	}
	
	func showAlert(title: String, message: String, typeButton: String) {
		let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let buttonOK = UIAlertAction(title: typeButton, style: .cancel, handler: nil)
		
		alert.addAction(buttonOK)
		self.controller.present(alert, animated: true, completion: nil)
	}
	
	func detailAlert(title: String, message: String, completion: @escaping() -> Void) {
	
		let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//		let buttonOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
		
		let buttonOK = UIAlertAction(title: "OK", style: .default) { (code) in
			completion()
		}
		
		alert.addAction(buttonOK)
		
		self.controller.present(alert, animated: true, completion: nil)
		
	}
	
}
