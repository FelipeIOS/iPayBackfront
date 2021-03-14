//
//  CadastroVC.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 14/03/21.
//

import UIKit

class CadastroVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func tappedCadastroButton(_ sender: UIButton) {
        
        let email = self.emailTextField.text ?? ""
        let senha = self.senhaTextField.text ?? ""
        
        CadastroController().createUser(email: email, senha: senha) { (email) in
            
            if email {
            self.performSegue(withIdentifier: "segueLogin", sender: self)
            
            } else {
                print("DEU RUIM 3!!!")
            }
        }
    }

}
