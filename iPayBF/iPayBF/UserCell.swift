//
//  UserCell.swift
//  iPayBF
//
//  Created by Felipe Miranda on 24/02/21.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: User?) {
        
        if let _value = value {
            self.nameLabel.text =  _value.name
            self.userImageView.image = UIImage(named: _value.imageName)
        }
    }
    
    

}
