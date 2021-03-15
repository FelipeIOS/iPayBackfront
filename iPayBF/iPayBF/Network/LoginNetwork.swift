//
//  LoginNetwork.swift
//  iPayBF
//
//  Created by Danilo Uvara de Souza on 14/03/21.
//

import Foundation
import Firebase



class LoginNetwork {


    func signin(email:String, password:String, completion:@escaping(_ usuario: Any?) -> Void) {
        
        let autenticacao:Auth = Auth.auth()
        
        autenticacao.signIn(withEmail: email, password: password) { (usuario, error) in
            
            
            if error == nil {
                
                if usuario == nil {
                    print("Tivemos algum problema inesperado, tente novamente")
                } else {
                    //self.loginButton.isEnabled = true
                    print("Login feito com sucesso")
                    completion(usuario)
                    
                }
                
            } else {
                print("Dados incorretos, verifique e tente novamente!!")
            }
        
        
    }
    
    }

}
