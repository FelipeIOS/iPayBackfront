//
//  AccountVC.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

class AccountVC: UIViewController {
	
	@IBOutlet weak var usersTableView: UITableView!
	
	var controller: AccountController = AccountController()
	
	
	// MARK: - Initialization
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.controller.loadAccount { (response) in
			print("loadAccount================================")
		}
		

	}
	
}
