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
class ProductViewModel {
    
    private var currentProductList: ProductList?
    
    init(value: ProductList?) {
      
        self.currentProductList = value
    }
    
    var name: String {
        return self.currentProductList?.name ?? ""
    }
    
    var price: String {
        return String(format: "R$ %.2f", self.currentProductList?.price ?? 0)
    }
    
    var quantity: String {
        
        return String(self.currentProductList?.quantity ?? 0)
    }
    
    var productImageType: UIImage {
        
        var image: UIImage = UIImage()
        
        if self.currentProductList?.productType == ProductType.refeicao.rawValue {
            image = UIImage(named: "food") ?? UIImage()
        }else {
            image = UIImage(named: "beer") ?? UIImage()
        }
        
        return image
    }
    
}

class HistoryAccountViewModel {
    
    private var currentHistoryAccountList: HistoryAccountList?
    private var currentProductList: ProductList?
    
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
    
    func setup(value: HistoryAccountViewModel?) {
        
        self.productLabel.text = value?.name
        self.qtdLabel.isHidden = true
        self.priceLabel.text =  value?.price
    }
    
    func setup(value: ProductList?) {
        
        let vm: ProductViewModel = ProductViewModel(value: value)
    
        self.productLabel.text = vm.name
        self.qtdLabel.text = String(vm.quantity)
        self.priceLabel.text =  vm.price
        self.productImageView.image = vm.productImageType
    
    }
}
