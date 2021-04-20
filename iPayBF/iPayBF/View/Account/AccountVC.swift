//
//  AccountVC.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

class AccountVC: UIViewController, AccountViewModelDelegate {
    func success() {
        self.loadTableView()
    }
    
    func failure() {
        
    }
    
    @IBOutlet weak var accountTableView: UITableView!
     var viewModel: AccountViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel  = AccountViewModel(delegate: self)
        self.accountTableView.register(UINib(nibName: "PaymentCell", bundle: nil), forCellReuseIdentifier: "PaymentCell")
        self.accountTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
       
        self.viewModel?.loadAccount()
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
        return self.viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.viewModel?.checkIfLastIndex(indexPath: indexPath) ?? false {
           
            let cell: PaymentCell? = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as? PaymentCell
            
            cell?.setup(value: self.viewModel?.loadTotalValue() ?? 0, delegate: self)

            return cell ?? UITableViewCell()
        }else{
            
            let cell: ProductCell? = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell
            
            cell?.setup(value: self.viewModel?.loadCurrentProduct(indexPath: indexPath))
        
            return cell ?? UITableViewCell()
        }
        
    }
}

// PRAGMA MARK:PaymentCellProtocol
extension AccountVC: PaymentCellProtocol {
    
    func tappedPaymentButton() {
        
        print("AccountVC: PaymentCellProtocol: tappedPaymentButton")
    }
}
