//
//  LoginNetwork.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 14/03/21.
//

import Foundation
import Firebase

class FirebaseNetwork {
    
    
    func createUser (email:String, senha:String, completion:@escaping(_ uid: String?) -> Void) {
        
        let autenticacao: Auth = Auth.auth()
        autenticacao.createUser(withEmail: email, password: senha) { (authResult, error) in
            
            if error == nil {
                print("Usuário cadastrado.")
                
                if authResult == nil {
                    print("DEU RUIM 2!!!")
                    
                } else {
                    print("Usuário cadastrado!")
                    completion(autenticacao.currentUser?.uid)
                }
            }
        }
    }
    
    func saveUser (email:String, senha:String, uid:String) {
        
        let database = Database.database().reference()
        let usuarios = database.child("usuarios")
        
        let dadosUsuario = [
            "email:": email,
            "senha:": senha
        ]
        
        usuarios.child(uid).setValue(dadosUsuario)
        
        print("Sucesso ao cadastrar!!!")
        
    }
    
    
    
    func sigin (email:String, senha:String, completion:@escaping(_ usuario: Any?) -> Void)  {
        
        let autenticacao: Auth = Auth.auth()
        autenticacao.signIn(withEmail: email, password: senha) { (usuario, error) in
            
            if error == nil {
                print("Validação correta.")
                
                if usuario == nil {
                    print("Usuário não retornado, tente novamente!")
                } else {
                    print("Login efetuado com sucesso!")
                    completion(usuario)
                }
                
            } else {
                print("Dados incorretos, verifique e tente novamente!")
                
            }
        }
    }
    
}

