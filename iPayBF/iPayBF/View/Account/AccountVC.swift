//
//  AccountVC.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

class AccountVC: UIViewController {

    private var controller: AccountController = AccountController()
    @IBOutlet weak var accountTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.accountTableView.register(UINib(nibName: "PaymentCell", bundle: nil), forCellReuseIdentifier: "PaymentCell")
        self.accountTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
        self.controller.loadAccount { (success, error) in
            
            if  success {
                self.loadTableView()
            }
                
        }
        // Do any additional setup after loading the view.
    }

    private func loadTableView() {
        
        self.accountTableView.delegate = self
        self.accountTableView.dataSource = self
        self.accountTableView.reloadData()
        
        print("loadTableView")
    }

}

extension AccountVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.controller.checkIfLastIndex(indexPath: indexPath) {
           
            let cell: PaymentCell? = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as? PaymentCell
            
            cell?.setup(value: self.controller.loadTotalValue(), delegate: self)

            return cell ?? UITableViewCell()
        }else{
            
            let cell: ProductCell? = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell
            
            cell?.setup(value: self.controller.loadCurrentProduct(indexPath: indexPath))
        
            return cell ?? UITableViewCell()
        }
        
    }
}


extension AccountVC: PaymentCellProtocol {
    
    func tappedPaymentButton() {
        print("AccountVC: PaymentCellProtocol: tappedPaymentButton")
    }
}
