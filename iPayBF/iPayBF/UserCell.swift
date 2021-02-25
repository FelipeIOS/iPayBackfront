//
//  UserCell.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 24/02/21.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    func setup(value: User?) {
        
        if let _value = value {
            self.nameLabel.text = _value.name
            self.userImageView.image = UIImage(named: _value.imageName)
        }
    }

}
