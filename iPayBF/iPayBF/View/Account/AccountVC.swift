//
//  AccountVC.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 05/03/21.
//

import UIKit

class AccountVC: UIViewController {

    private var controller: AccountController = AccountController()
    @IBOutlet weak var accountTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.accountTableView.register(nibName, forCellReuseIdentifier: <#T##String#>)
        
        self.controller.loadAccount { (success, error) in
        
            if success {
                
                self.accountTableView.delegate = self
                self.accountTableView.dataSource = self
            }
                
            }
            
        }
    
    }

extension AccountVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProductCell? = tableView
        
        
    }
    
    
}
    
    


