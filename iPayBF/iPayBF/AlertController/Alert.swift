//
//  Alert.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 26/02/21.
//

import Foundation
import UIKit
import PopupDialog

class Alert {
    
    var controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func showPopup(completion:@escaping() -> Void) {
        
        let title: String = "Aeeeee :)"
        let msg: String = "Você foi o premiado da vez,entregue seu cartão e faça a boa para os seus amigos da mesa, pague a conta!!!"
        let image = UIImage(named: "Image")
        
        
        let popup: PopupDialog = PopupDialog(title: title, message: msg, image: image)
        
        popup.view.backgroundColor = .black
        
        let button = DefaultButton(title: "OK") {
            
            print("clicou no OK")
            
            completion()
        }
        
        button.backgroundColor = UIColor(cgColor: CGColor(red: 75/255.0, green: 162/255.0, blue: 218/255.0, alpha: 1))
        button.titleColor = .white
        
        popup.addButton(button)
        
        self.controller.present(popup, animated: true, completion: nil)
        
    }
 
    func showAlert(titulo:String, mensagem:String, tituloBotao:String){
        //configura meu alert
        let alert:UIAlertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        //configura a ação dos botões
        let ok:UIAlertAction = UIAlertAction(title: tituloBotao, style: .cancel, handler: nil)
        //configura o botão (ação) no alert
        alert.addAction(ok)
        //apresenta meu alert
        controller.present(alert, animated: true, completion: nil)
    }
    
    func detailAlert(titulo:String, mensagem:String, completion:@escaping(_ value: Bool) -> Void) {
        
        let alert:UIAlertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)

        let ok:UIAlertAction = UIAlertAction(title: "OK Entendi", style: .default) { (acao) in
            completion(true)
        }
        
        alert.addAction(ok)
        
        self.controller.present(alert, animated: true, completion: nil)
    }
    
}
