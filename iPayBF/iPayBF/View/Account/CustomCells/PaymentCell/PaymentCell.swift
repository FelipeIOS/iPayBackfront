//
//  PaymentCell.swift
//  iPayBF
//
//  Created by ANDRE LUIZ TONON on 05/03/21.
//

import UIKit

class PaymentCell: UITableViewCell {

    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBOutlet weak var paymentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func tappedPaymentButton(_ sender: UIButton) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
