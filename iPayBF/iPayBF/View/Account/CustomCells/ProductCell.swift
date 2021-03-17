//
//  ProductCell.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

class ProductCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var productLabel: UILabel!
	@IBOutlet weak var qtdLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var productImageView: UIImageView!
	
	// MARK: - Variable
	static let identifier: String = "ProductCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	
	// MARK: - Initialization
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	
	// MARK: - Function
	func setupCell(product: ProductList) {
		self.productLabel.text	= product.name
		self.qtdLabel.text 		= String(product.quantity)
		self.priceLabel.text 	= String(format: "R$ %.2f ", product.price)
		
		if product.productType == "REFEIÇÃO" {
			self.productImageView.image = UIImage(named: "food")
		} else {
			self.productImageView.image = UIImage(named: "beer")
		}
	}
	
	func setupCell(value: HistoryAccountList?) {
		guard let _value = value else { return  }
		self.productLabel.text = _value.name
		self.qtdLabel.isHidden = true
		self.priceLabel.text = String(format: "R$ %.2f ", _value.price)
//		self.productImageView.image = UIImage(named: _value.iconImage)
	}
	
}
