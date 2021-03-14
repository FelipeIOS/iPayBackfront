//
//  CadastroVC.swift
//  iPayBF
//
//  Created by Danilo Uvara de Souza on 14/03/21.
//

import UIKit
import Firebase


class CadastroVC: UIViewController {
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
        let autenticacao:Auth = Auth.auth()
        let email:String = emailTextField.text  ??  ""
        let password:String = passwordTextField.text  ??  ""
        
        autenticacao.createUser(withEmail: email, password: password) { (usuario, error) in
            
            if error == nil {
                
                let database = Database.database().reference()
                let usuarios = database.child("usuarios")
                
                let dadosUsuario = [
                    "email": autenticacao.currentUser?.email,
                    "senha": password
                ]
                
                usuarios.child(autenticacao.currentUser?.uid ?? "" ).setValue(dadosUsuario)
                
                print("suscesso ao cadastrar!!!!!")
                
            } else {
                
            print("erro ao cadastrar")
            }
            
        }
        
        
        
    }
    
    

}
