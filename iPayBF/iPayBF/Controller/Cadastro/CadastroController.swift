//
//  CadastroController.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 14/03/21.
//

import Foundation

class CadastroController {
    
    
    func createUser (email:String, senha:String, completion:@escaping(_ success: Bool) -> Void) {
        
        FirebaseNetwork().createUser(email: email, senha: senha) { (uid) in
            
            if uid == nil {
                completion(false)
                
            } else {
                self.saveUser(email: email, senha: senha, uid: uid ?? "")
                completion(true)
            }
        }
    }
    
    func saveUser (email:String, senha:String, uid:String) {
    
        FirebaseNetwork().saveUser(email: email, senha: senha, uid: uid)
    }
    
    
}




