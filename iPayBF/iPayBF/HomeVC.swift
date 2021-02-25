//
//  ViewController.swift
//  iPayBF
//
//  Created by Felipe Miranda on 22/02/21.
//

import UIKit

class User {
    
    var name:String
    var imageName:String
    
    init(name:String, imageName:String) {
        self.name = name
        self.imageName = imageName
    }
}

class HomeVC: UIViewController {
    
    var arrayNameImage:[String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    
    var arrayUser:[User] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sortButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    

    @IBAction func tappedSortButton(_ sender: UIButton) {
    }

    
}

extension HomeVC: UITextFieldDelegate {
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UserCell? = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        
        cell?.nameLabel.text = self.arrayUser[indexPath.row].name
        cell?.userImageView.image = UIImage(named:self.arrayNameImage[indexPath.row].imageName)
        return cell? ?? UITableViewCell()
    }
    
    
}
