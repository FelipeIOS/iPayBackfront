//
//  HomeController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 24/02/21.
//

import Foundation
import UIKit


class HomeController {
	
	// MARK: - Variable
	var imageCartao: [UIImage] = [ UIImage(named: "credit-card") ?? UIImage()]
	var imagemUsers: [UIImage] = [ UIImage(named: "Image-1") ?? UIImage(),
											 UIImage(named: "Image-2") ?? UIImage(),
											 UIImage(named: "Image-3") ?? UIImage(),
											 UIImage(named: "Image-4") ?? UIImage(),
											 UIImage(named: "Image-5") ?? UIImage(),
	]
	var sortedUser: Usuario?
	var users: [Usuario] = []
	
	
	// MARK: - Function
	func sortUser() {
		self.sortedUser = self.users.randomElement()
	}
	
	func addUser(nome: String) {
		self.users.append(Usuario(nome: nome,
										  imageUser: imagemUsers.randomElement() ?? UIImage(),
										  cartao: imageCartao[0]))
	}
	
	func count() -> Int {
		self.users.count
	}
	
	func checkUserPayer(indexPath: IndexPath) -> Bool {
		
		if self.sortedUser == self.users[indexPath.row] {
			return true
		} else {
			self.users.remove(at: indexPath.row)
			return false
		}
		
		
	}
	
	func getUser(indexPath: IndexPath) -> Usuario {
		return self.users[indexPath.row]
	}
	
	
}
