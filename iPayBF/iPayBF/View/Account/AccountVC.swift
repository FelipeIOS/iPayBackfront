//
//  AccountVC.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

class AccountVC: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var usersTableView: UITableView!
	
	// MARK: - Variable
	var controller: AccountController = AccountController()
	
	
	
	// MARK: - Initialization
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getLoadAccount()
	}
	
	// MARK: - Function
	private func configTableView() {
		self.usersTableView.delegate = self
		self.usersTableView.dataSource = self
		self.usersTableView.register(ProductCell.nib(),
											  forCellReuseIdentifier: ProductCell.identifier)
		self.usersTableView.register(PaymentCell.nib(),
											  forCellReuseIdentifier: PaymentCell.identifier)
		
		self.usersTableView.reloadData()
	}
	
	private func getLoadAccount() {
		
		self.controller.loadAccount { (success, error) in
			if success {
				self.configTableView()
			}
		}
		
	}
	
}


// MARK: - Extension TableView
extension AccountVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.controller.getCount()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if self.controller.checkIfLastIndex(indexPath: indexPath) {			
			guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentCell.identifier,
																		  for: indexPath) as? PaymentCell
			else { return UITableViewCell() }
			
			cell.setupCell(total: self.controller.getTotal(), delegate: self)
			return cell
		}
		
		guard let product = self.controller.getProduct(at: indexPath.row) else { return UITableViewCell() }
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier,
																	  for: indexPath) as? ProductCell
		else { return UITableViewCell() }
		
		cell.setupCell(product: product)
		return cell
	}
	
}


// MARK: - Extension PaymentCell
extension AccountVC: PaymentCellProtocol {
	
	func tappedPaymentButton() {
		print(#function)
		self.dismiss(animated: true, completion: nil)
	}
	
}
