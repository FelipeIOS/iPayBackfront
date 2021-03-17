//
//  HistoryVC.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 15/03/21.
//

import UIKit

class HistoryVC: UIViewController {

    @IBOutlet weak var historyTableView: UITableView!
    
    private var controller: HistoryController = HistoryController()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.controller.loadHistory { (success, error) in
            
            if success {
                self.historyTableView.delegate = self
                self.historyTableView.dataSource = self
                self.historyTableView.reloadData()
                self.historyTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
                
            } else {
                print(error)
            }
        }
    }
}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProductCell? = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell
        
        cell?.setup(value: self.controller.loadCurrentHistoryAccount(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
    
}
