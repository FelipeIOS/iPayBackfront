//
//  ViewController.swift
//  iPayBF
//
//  Created by Felipe Miranda on 22/02/21.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var usersTableView: UITableView!
    
    
    private var controller: HomeController = HomeController()
    var alert:Alert?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usersTableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        
        self.usersTableView.tableFooterView = UIView()
        self.usersTableView.dataSource = self
        self.usersTableView.delegate = self
        self.nameTextField.delegate = self
        self.blockedSortButton()
        self.alert = Alert(controller: self)
        self.sortButton.layer.cornerRadius = 5
    
        
    }
    
    private func blockedSortButton() {
        
        if self.controller.blockedSortButton() {
            self.sortButton.isUserInteractionEnabled = false
            self.sortButton.alpha = 0.5
        } else {
            self.sortButton.isUserInteractionEnabled = true
            self.sortButton.alpha = 1.0
        }
        
    }
    
    @IBAction func tappedSortButton(_ sender: UIButton) {
    
        self.nameTextField.resignFirstResponder()
        self.controller.sortUser()

    }
    
}

extension HomeVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.controller.addUser(name: textField.text)
        textField.text = nil
        self.blockedSortButton()
        self.usersTableView.reloadData()
        
        return true
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if self.controller.checkEmptyState() {
            
            let cell: EmptyCell? = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell
            
            return cell ?? UITableViewCell()
            
        }else{
            
            let cell: UserCell? = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell

            cell?.setup(value: self.controller.loadCurrentUser(indexPath: indexPath))
            
            return cell ?? UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.controller.checkUserPayer(indexPath: indexPath) {

            
            self.alert?.showPopup(completion: {
                self.controller.removeAllUsers()
                self.usersTableView.reloadData()
                self.blockedSortButton()
            })
           // self.alert?.showAlert(titulo: "Parabéns!", mensagem: "Você foi o sorteado da vez, pague a conta!", tituloBotao: "Foge não!")
            
            // funçao - metodo de classe e metodo de instancia. Metodo de instancia e metodo estatico.
            
            
        }else{
            self.usersTableView.reloadData()
        }
    }
    
}
