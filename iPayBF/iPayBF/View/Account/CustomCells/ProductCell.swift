//
//  ProductCell.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 05/03/21.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var qtdLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()

        
        
    }

    func setup(value: ProductList?) {
        if let _value = value {
            self.productLabel.text = _value.name
            self.qtdLabel.text = String(_value.quantity)
            self.priceLabel.text = "R$\(_value.price)"
            
        }
        
    }

    
}
