//
//  ProductCell.swift
//  iPayBF
//
//  Created by ANDRE LUIZ TONON on 05/03/21.
//

import UIKit

class ProductCell: UITableViewCell {

    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!
    
    @IBOutlet weak var valorLabel: UILabel!
    
    @IBOutlet weak var quantidadeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
