//
//  ProductCell.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

enum ProductType:String {
    case refeicao = "REFEIÇÃO"
    case bebida = "BEBIDA"
}

class ProductCellViewModel {
    
    private var currentHistoryAccountList: HistoryAccountList?
    
    init(value: HistoryAccountList?) {
        self.currentHistoryAccountList = value
    }
    
    var name: String {
        return self.currentHistoryAccountList?.name ?? ""
    }
    
    var price: String {
        return String(format: "R$ %.2f", self.currentHistoryAccountList?.price ?? 0)
    }
    
}


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
    
    func setup(value: ProductCellViewModel?) {
        
        self.productLabel.text = value?.name
        self.qtdLabel.isHidden = true
        self.priceLabel.text =  value?.price
    }
    
    func setup(value: ProductList?) {
        
        if let _value = value {
            self.productLabel.text = _value.name
            self.qtdLabel.text = String(_value.quantity)
            self.priceLabel.text =  String(format: "R$ %.2f", _value.price)
       
            if _value.productType == ProductType.refeicao.rawValue {
                self.productImageView.image = UIImage(named: "food")
            }else{
                self.productImageView.image = UIImage(named: "beer")
            }
        }
    }
}
