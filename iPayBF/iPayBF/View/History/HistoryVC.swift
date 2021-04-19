//
//  HistoryVC.swift
//  iPayBF
//
//  Created by Felipe Miranda on 15/03/21.
//

import UIKit

class HistoryVC: UIViewController,HistoryViewModelDelegate {
    
    func successLoadHistory(value: Bool) {
        
        self.historyTableView.delegate = self
        self.historyTableView.dataSource = self
        self.historyTableView.reloadData()
    }
    
    func failureLoadHistory(value: NSError?) {
        print(value ?? "")
    }
    
    
    @IBOutlet weak var historyTableView: UITableView!
    
    var viewModel: HistoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = HistoryViewModel(delegate: self)
        
        self.historyTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
        self.viewModel?.loadHistory()

    }
    
}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProductCell? = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell
        
        cell?.setup(value: self.viewModel?.loadCurrentHistoryAccount(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
}
