//
//  AccountVC.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

class AccountVC: UIViewController {

    private var controller: AccountController = AccountController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.controller.loadAccount { (response) in
            
            
        }
        // Do any additional setup after loading the view.
    }

}
