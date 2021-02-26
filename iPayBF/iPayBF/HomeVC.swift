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
//        self.arrayUser.append(User(name: "Felipe", imageName: self.arrayNameImages.first ?? ""))
        
        self.usersTableView.dataSource = self
        self.usersTableView.delegate = self
        self.nameTextField.delegate = self
    
        // Do any additional setup after loading the view.
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
