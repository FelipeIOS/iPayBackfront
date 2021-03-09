//
//  AccountVCViewController.swift
//  iPayBF
//
//  Created by ANDRE LUIZ TONON on 05/03/21.
//

import UIKit

class AccountVC: UIViewController {

    private var controller: AccountController = AccountController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.controller.loadAccount { (response) in
        
//        self.controller.loadAccount { (Account) in
//
//            print(Account.totalValue)
//
        }
        
        // Do any additional setup after loading the view.
    }
    
}


