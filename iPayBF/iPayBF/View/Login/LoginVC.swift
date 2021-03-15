//
//  LoginVC.swift
//  iPayBF
//
//  Created by Danilo Uvara de Souza on 14/03/21.
//

import UIKit
import Foundation

class LoginVC: UIViewController {
    

    @IBOutlet weak var emailTextField: UITextField!
    
    

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.loginButton.isEnabled = false

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func tappedLoginButton(_ sender: UIButton) {
        
       
        let email:String = self.emailTextField.text  ??  ""
        let password:String = self.passwordTextField.text  ??  ""
        
        
        LoginController().signin(email: email, password: password) { (usuario) in
            if usuario {
                self.performSegue(withIdentifier: "seguetohome", sender: self)
            } else {
                print("deu ruim")
                
                
                
            }
        }
        
        
        
        
        
        
        
//        autenticacao.signIn(withEmail: email, password: password) { (usuario, error) in
//
//            if error == nil {
//
//                if usuario == nil {
//                    print("Tivemos algum problema inesperado, tente novamente")
//                } else {
//                    //self.loginButton.isEnabled = true
//                    print("Login feito com sucesso")
//
//                    self.performSegue(withIdentifier: "seguetohome", sender: self)
//
//
//                }
//
//            } else {
//                print("Dados incorretos, verifique e tente novamente!!")
//            }
//
//        }
//
//
//
//
//
        
        
        
        
    }
    
    

}
