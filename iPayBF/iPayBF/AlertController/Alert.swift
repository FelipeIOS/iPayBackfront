//
//  Alert.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 26/02/21.
//

import Foundation
import UIKit

class Alert {
    
    var controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
 
    func showAlert(titulo:String, mensagem:String, tituloBotao:String) {
        //configura meu alert
        let alert:UIAlertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        //configura a ação dos botões
        let ok:UIAlertAction = UIAlertAction(title: tituloBotao, style: .cancel, handler: nil)
        //configura o botão (ação) no alert
        alert.addAction(ok)
        //apresenta meu alert
        controller.present(alert, animated: true, completion: nil)
    }
    
    func detailAlert(titulo:String, mensagem:String, completion:@escaping() -> Void) {
        
        let alert:UIAlertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)

        let ok:UIAlertAction = UIAlertAction(title: "OK Entendi", style: .default) { (acao) in
            completion()
        }
        
        alert.addAction(ok)
        
        self.controller.present(alert, animated: true, completion: nil)
    }
    
}
