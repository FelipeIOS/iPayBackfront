//
//  UserCell.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 24/02/21.
//

import UIKit

class UserCell: UITableViewCell {
    
    let identifier:String = "UserCell"
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }


    

}
