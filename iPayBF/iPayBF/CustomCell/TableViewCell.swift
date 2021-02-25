//
//  TableViewCell.swift
//  iPayBF
//
//  Created by ANDRE LUIZ TONON on 22/02/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
        
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    
    static let identifier:String = "TableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(){
        
        
    }
    
}
