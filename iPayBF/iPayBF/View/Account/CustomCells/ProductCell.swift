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
	
	
	// MARK: - Initialization
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
}
