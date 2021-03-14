//
//  ViewController.swift
//  iPayBF
//
//  Created by Felipe Miranda on 22/02/21.
//

import UIKit

class HomeVC: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var logoImageView: UIImageView!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var sortButton: UIButton!
	@IBOutlet weak var usersTableView: UITableView!
	
	// MARK: - Variable
	private var controller: HomeController = HomeController()
	var alert:Alert?
	
	override func viewDidLoad() {
		super.viewDidLoad()
				
		self.configTableView()
		self.configTextField()
		self.configButton()
		self.blockedSortButton()
		self.alert = Alert(controller: self)
	}
	
	
	// MARK: - Funtion
	private func configTableView() {
		self.usersTableView.dataSource = self
		self.usersTableView.delegate = self
		self.usersTableView.tableFooterView = UIView()
		self.usersTableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
	}
	
	private func configTextField() {
		self.nameTextField.delegate = self
	}
	
	private func configButton() {
		self.sortButton.layer.cornerRadius = 5
	}
	
	private func blockedSortButton() {
		
		if self.controller.blockedSortButton() {
			self.sortButton.isUserInteractionEnabled = false
			self.sortButton.alpha = 0.5
		} else {
			self.sortButton.isUserInteractionEnabled = true
			self.sortButton.alpha = 1.0
		}
		
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedSortButton(_ sender: UIButton) {
		self.controller.sortUser()
		self.sortButton.isUserInteractionEnabled = false
		self.nameTextField.isUserInteractionEnabled = false
		self.sortButton.alpha = 0.5
	}
	
	@IBAction func tappedSignOutButton(_ sender: UIButton) {
		LoginWorker().signOutFirebase()
		self.dismiss(animated: true, completion: nil)
	}
	
	
}

extension HomeVC: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.controller.addUser(name: textField.text)
		textField.text = nil
		textField.resignFirstResponder()
		self.blockedSortButton()
		self.usersTableView.reloadData()
		
		return true
	}
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.controller.count()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if self.controller.checkEmptyState() {
			let cell: EmptyCell? = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell
			return cell ?? UITableViewCell()
			
		} else {
			let cell: UserCell? = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
			cell?.setup(value: self.controller.loadCurrentUser(indexPath: indexPath))
			return cell ?? UITableViewCell()
		}
		
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if self.controller.checkUserPayer(indexPath: indexPath) {
			
			self.alert?.detailAlert(titulo: "", mensagem: "", completion: { (success) in
				if success {
					self.controller.removeAllUsers()
					self.usersTableView.reloadData()
					self.blockedSortButton()
					self.nameTextField.isUserInteractionEnabled = true
					self.performSegue(withIdentifier: "segueDetalhe", sender: self)
				}
			})
			
		} else {
			self.usersTableView.reloadData()
		}
	}
	
}
