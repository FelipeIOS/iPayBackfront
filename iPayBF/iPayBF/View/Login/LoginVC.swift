//
//  LoginVC.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 14/03/21.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        
        let email:String = self.emailTextField.text ?? ""
        let senha:String = self.senhaTextField.text ?? ""

        LoginController().sigin(email: email, senha: senha) { (usuario) in
            
            if usuario {
                self.performSegue(withIdentifier: "segueHome", sender: self)
                
            } else {
                print("DEU RUIM!!!!!")
            }
        }
    }
    
    
}
