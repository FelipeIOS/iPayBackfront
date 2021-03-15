//
//  LoginController.swift
//  iPayBF
//
//  Created by Danilo Uvara de Souza on 14/03/21.
//

import Foundation
import UIKit


class LoginController {
    

    func signin(email:String, password:String, completion:@escaping(_ sucess:Bool) -> Void) {
        
        LoginNetwork().signin(email: email, password: password) { (usuario) in
            if usuario == nil {
                completion(false)
                
            } else {
                completion(true)
            }
        }
        
    }

    
}

