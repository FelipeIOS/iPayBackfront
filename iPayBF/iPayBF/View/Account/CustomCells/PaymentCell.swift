//
//  PaymentCell.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

class PaymentCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var cardImageView: UIImageView!
	@IBOutlet weak var paymentButton: UIButton!
	
	
	// MARK: - Initialization
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedPaymentButton(_ sender: UIButton) {
	}
	
}
