//
//  HomeViewController.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 22/02/21.
//

import UIKit

class HomeViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var sortButton: UIButton!
	
	// MARK: - Variable
	private var controller: HomeController = HomeController()
	private var alert: Alert?
	
	
	override func viewDidLoad() {
		print(#function)
		
		super.viewDidLoad()
		
		self.configTableView()
		self.configTextField()
		self.blockedSortButon()
		self.configButton()
		
		self.alert = Alert(controller: self)
	}
	
	
	// MARK: - Function
	func configTableView() {
		self.tableView.backgroundColor = .darkGray
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.register(ListaUserTableViewCell.nib(), forCellReuseIdentifier: ListaUserTableViewCell.identifier)
		self.tableView.register(EmptyTableViewCell.nib(), forCellReuseIdentifier: EmptyTableViewCell.identifier)
		self.tableView.tableFooterView = UIView()
	}
	
	func configTextField() {
		self.nomeTextField.delegate = self
	}
	
	func configButton() {
		self.sortButton.layer.cornerRadius = 5
	}
	
	private func blockedSortButon() {
		if self.controller.blockedSortButton() {
			self.sortButton.isUserInteractionEnabled = false
			self.sortButton.alpha = 0.5
		} else {
			self.sortButton.isUserInteractionEnabled = true
			self.sortButton.alpha = 1.0
		}
	}
	
	
	// MARK: - Action
	@IBAction func didTapSortearButton(_ sender: UIButton) {
		self.nomeTextField.isEnabled = false
		
		self.sortButton.isUserInteractionEnabled = false
		self.sortButton.alpha = 0.5
		
		self.controller.sortUser()
	}
	
	
}


// MARK: - Extension -> TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return self.controller.count()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if self.controller.checkEmptyState() {
			
			let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier, for: indexPath) as? EmptyTableViewCell
			return cell ?? UITableViewCell()
			
		} else {
			
			let cell = tableView.dequeueReusableCell(withIdentifier: ListaUserTableViewCell.identifier, for: indexPath) as? ListaUserTableViewCell
			cell?.configCell(user: self.controller.getUser(indexPath: indexPath))
			return cell ?? UITableViewCell()
			
		}
		
		
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if self.controller.checkUserPayer(indexPath: indexPath) {
			
			self.alert?.showPopup(completion: {
				print("Show Popup - Com Completion")
				
				self.controller.removeAllUsers()
				self.blockedSortButon()
				self.nomeTextField.isEnabled = true
				self.tableView.reloadData()
			})
			
//			self.alert?.showPopup {
//				print("Show Popup - Sem Completion")
//
//				self.controller.removeAllUsers()
//				self.blockedSortButon()
//				self.nomeTextField.isEnabled = true
//				self.tableView.reloadData()
//			}
			
			//			self.alert?.detailAlert(title: "Parabéns", message: "Paga ai po", completion: {
			//				print("Saindo o AlertController")
			//
			//				self.controller.removeAllUsers()
			//				self.blockedSortButon()
			//				self.nomeTextField.isEnabled = true
			//				self.tableView.reloadData()
			//
			//			})
			
			print("Sorteado!!")
			
		} else {
			print("Ufa!")
		}
		
		self.tableView.reloadData()
	}
	
}


// MARK: - Extension -> TextField
extension HomeViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		if let nome = self.nomeTextField.text {
			self.controller.addUser(nome: nome)
			self.tableView.reloadData()
		}
		
		self.blockedSortButon()
		self.nomeTextField.resignFirstResponder()
		self.nomeTextField.text = nil
		return false
	}
	
}
