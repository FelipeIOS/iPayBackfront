//
//  HomeController.swift
//  iPayBF
//
//  Created by Felipe Miranda on 24/02/21.
//

import Foundation

class HomeController {
	
	// MARK: - Variable
	var arrayNameImages:[String] = ["Image-1","Image-2","Image-3","Image-4","Image-5"]
	var arrayUser:[User] = []
	var sortedUser:User?
	
	
	// MARK: - Function
	func removeAllUsers() {
		arrayUser.removeAll()
		sortedUser = nil
	}
	
	func sortUser() {
		self.sortedUser = self.arrayUser.randomElement()
	}
	
	func addUser(name: String?) {
		self.arrayUser.append(User(name: name ?? "", imageName: self.arrayNameImages.randomElement() ?? ""))
	}
	
	func blockedSortButton() -> Bool {
		if self.arrayUser.count > 1 {
			return false
		} else {
			return true
		}
	}
	
	func checkEmptyState() -> Bool {
		
		if self.arrayUser.count > 0 {
			return false
		}
		return true
	}
	
	func count() -> Int {
		
		if self.arrayUser.count > 0 {
			return self.arrayUser.count
		}
		return 1
	}
	
	func loadCurrentUser(indexPath: IndexPath) -> User {
		return self.arrayUser[indexPath.row]
	}
	
	func checkUserPayer(indexPath: IndexPath) -> Bool {
		
		if self.arrayUser.count == 0 {
			return false
		}
		
		if self.sortedUser === self.arrayUser[indexPath.row] {
			return true
		} else {
			self.arrayUser.remove(at: indexPath.row)
			return false
		}
	}
	
}
