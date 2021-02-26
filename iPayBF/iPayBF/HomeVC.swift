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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usersTableView.dataSource = self
        self.usersTableView.delegate = self
        self.nameTextField.delegate = self
        self.blockedSortButton()
        
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
        print("tappedSortButton")
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
        
        let cell: UserCell? = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell

        cell?.setup(value: self.controller.loadCurrentUser(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.controller.checkUserPayer(indexPath: indexPath) {
            
            print("parabens vc foi o sorteado da vez, pague a conta")
        }else{
            self.usersTableView.reloadData()
        }

    }
}
