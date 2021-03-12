//
//  ProductCell.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var qtdLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(value: ProductList?) {
        
        if let _value = value {
            self.productLabel.text = _value.name
            self.qtdLabel.text = String(_value.quantity)
            self.priceLabel.text = "R$\(_value.price)"
        }
        
        if value?.name == "Caipirinha" {
            self.productImageView.image = UIImage(named: "caipirinha")

        } else if value?.name == "Fritas" {
            self.productImageView.image = UIImage(named: "fritas")

        } else if value?.name == "Bolinho de arroz" {
            self.productImageView.image = UIImage(named: "bolinho")

        } else {
            self.productImageView.image = UIImage(named: "beer")

        }
    }
}
