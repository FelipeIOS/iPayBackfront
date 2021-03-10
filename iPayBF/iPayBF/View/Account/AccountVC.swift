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
	var account: Account?
	
	
	// MARK: - Initialization
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getLoadAccount()
		configTableView()
	}
	
	// MARK: - Function
	private func configTableView() {
		print(#function)
		self.usersTableView.delegate = self
		self.usersTableView.dataSource = self
	}
	
	private func getLoadAccount() {
		self.controller.loadAccount { (_account) in
			self.account = _account
			print(#function)
			self.usersTableView.reloadData()
		}
		
	}
	
}


// MARK: - Extension TableView
extension AccountVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.account?.productList.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
	
}
