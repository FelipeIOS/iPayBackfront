//
//  LoginController.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 14/03/21.
//

import Foundation

class LoginController {
    
    func sigin (email:String, senha:String, completion:@escaping(_ success: Bool) -> Void)  {
        
        FirebaseNetwork().sigin(email: email, senha: senha) { (usuario) in
            
            if usuario == nil {
                completion(false)
                
            } else {
                completion(true)
            }
        }
        
    }
}
