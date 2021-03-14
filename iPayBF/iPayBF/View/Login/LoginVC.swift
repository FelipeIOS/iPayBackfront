//
//  LoginVC.swift
//  iPayBF
//
//  Created by Danilo Uvara de Souza on 14/03/21.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    

    @IBOutlet weak var emailTextField: UITextField!
    
    

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tappedLoginButton(_ sender: UIButton) {
        
        let autenticacao:Auth = Auth.auth()
       
        let email:String = self.emailTextField.text  ??  ""
        let password:String = self.passwordTextField.text  ??  ""
        
        var validacao:Bool = false
        
        
        
        autenticacao.signIn(withEmail: email, password: password) { (usuario, error) in
            
            if error == nil {
                
                if usuario == nil {
                    print("Tivemos algum problema inesperado, tente novamente")
                } else {
                    validacao = true
                    print("Login feito com sucesso")
                }
                
            } else {
                print("Dados incorretos, verifique e tente novamente!!")
            }
            
        }
        
        if validacao == true {
            tappedLoginButton(<#T##sender: UIButton##UIButton#>)
        }
        
        
        
        
        
    }
    
    

}
