//
//  AccountVCViewController.swift
//  iPayBF
//
//  Created by ANDRE LUIZ TONON on 05/03/21.
//

import UIKit

class AccountVC: UIViewController {

    private var controller: AccountController = AccountController()
    
    @IBOutlet weak var accountTableView: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.accountTableView.register(UINib:, forCellReuseIdentifier: <#T##String#>)
        self.controller.loadAccount { (sucess, error) in
        
            if let _account = account {
                
                self.accountTableView.delegate = self
                self.accountTableView.dataSource = self
                
            }
            
//        self.controller.loadAccount { (Account) in
//
//            print(Account.totalValue)
//
        }
        
        // Do any additional setup after loading the view.
    }
    
}

extension AccountVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.controller.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProductCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell
        
        cell? setup(value: self.controller.loadCurrentProduct(indexPath: indexPath))
    }
    
    
    
}
