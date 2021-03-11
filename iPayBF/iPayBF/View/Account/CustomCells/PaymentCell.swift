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

    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var totalValueLabel: UILabel!
    weak var delegate: PaymentCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tappedPaymentButton(_ sender: UIButton) {
        print("PaymentCell:tappedPaymentButton")
        self.delegate?.tappedPaymentButton()
    }
    
    func setup(value: Float, delegate: PaymentCellProtocol?) {
        self.delegate = delegate
        self.totalValueLabel.text = String(format: "Valor total:      R$ %.2f", value)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
