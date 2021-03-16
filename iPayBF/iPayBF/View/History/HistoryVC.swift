//
//  HistoryVC.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 15/03/21.
//

import UIKit

class HistoryVC: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var historyTableView: UITableView!
	
	// MARK: - Variable
	private let controller: HistoryController = HistoryController()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.controller.loadHistory { (success, error) in
			if success {
				self.configTableView()
			} else {
				print("\(String(describing: error?.localizedDescription))")
			}
		}
		
	}
	
	private func configTableView() {
		self.historyTableView.delegate = self
		self.historyTableView.dataSource = self
		self.historyTableView.register(UINib(nibName: "ProductCell", bundle: nil),
												 forCellReuseIdentifier: "ProductCell")
		self.historyTableView.reloadData()
	}
	
		
}


// MARK: - Extension TableView
extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.controller.numberOfRows
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: ProductCell? = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell
		
		cell?.setupCell(value: self.controller.loadCurrentHistoryAccount(indexPath: indexPath))
		
		return cell ?? UITableViewCell()
	}
	
	
}
