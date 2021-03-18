//
//  PaymentCell.swift
//  iPayBF
//
//  Created by Felipe Miranda on 05/03/21.
//

import UIKit

protocol PaymentCellProtocol: class {
	func tappedPaymentButton()
}

class PaymentCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var cardImageView: UIImageView!
	@IBOutlet weak var paymentButton: UIButton!
	@IBOutlet weak var totalValuelabel: UILabel!
	
	// MARK: - Variable
	static let identifier: String = "PaymentCell"
	weak var delegate: PaymentCellProtocol?
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	
	// MARK: - Initialization
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	// MARK: - Function
	func setupCell(total: Float, delegate: PaymentCellProtocol) {
		self.delegate = delegate
		self.totalValuelabel.text = String(format: "Valor total: R$ %.2f", total)
	}
	
	func setupCell(total: Float) {
		self.paymentButton.isHidden = true
		self.totalValuelabel.text = String(format: "Valor total: R$ %.2f", total)
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedPaymentButton(_ sender: UIButton) {
		self.delegate?.tappedPaymentButton()
	}
	
}
