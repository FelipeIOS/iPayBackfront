//
//  AccountVC.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 05/03/21.
//

import UIKit

class AccountVC: UIViewController {

    private var controller: AccountController = AccountController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.controller.loadAccount { (account) in
        
            self.controller.loadAccount { (response) in
                
            }
            
        }
    
    }
    
    


}
