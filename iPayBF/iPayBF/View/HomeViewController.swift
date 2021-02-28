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
	
//	override func loadView() {
//		print(#function)
//	}

	override func viewDidLoad() {
		print(#function)
		
		super.viewDidLoad()
		
		configTableView()
		configTextField()
		self.blockedSortButon()
		
		self.alert = Alert(controller: self)
	}
	
//	override func viewWillAppear(_ animated: Bool) {
//		super.viewWillAppear(animated)
//		print(#function)
//	}
//	
//	override func viewWillLayoutSubviews() {
//		print(#function)
//	}
//	
//	override func viewDidLayoutSubviews() {
//		print(#function)
//	}
//	
//	override func viewDidAppear(_ animated: Bool) {
//		super.viewDidAppear(animated)
//		print(#function)
//	}
//	
//	override func viewWillDisappear(_ animated: Bool) {
//		super.viewWillDisappear(animated)
//		print(#function)
//	}
//	
//	override func viewDidDisappear(_ animated: Bool) {
//		super.viewDidDisappear(animated)
//		print(#function)
//	}
	
	
	// MARK: - Function
	func configTableView() {
		self.tableView.backgroundColor = .darkGray
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.register(ListaUserTableViewCell.nib(), forCellReuseIdentifier: ListaUserTableViewCell.identifier)
	}
	
	func configTextField() {
		self.nomeTextField.delegate = self
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
		let cell = tableView.dequeueReusableCell(withIdentifier: ListaUserTableViewCell.identifier, for: indexPath) as? ListaUserTableViewCell
		cell?.configCell(user: self.controller.getUser(indexPath: indexPath))
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if self.controller.checkUserPayer(indexPath: indexPath) {
			
//			self.alert?.showAlert(title: "Parabéns", message: "Você foi sorteado para pagar a conta!", typeButton: "Foge não")
			self.alert?.detailAlert(title: "Parabéns", message: "Paga ai po", completion: {
				print("Saindo o AlertController")
			})
			
			
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
