//
//  UserCell.swift
//  iPayBF
//
//  Created by Felipe Miranda on 24/02/21.
//

import UIKit

class UserCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var userImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var cardImageView: UIImageView!
	
	
	// MARK: - Initialization
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	// MARK: - Function
	func setup(value: User?) {
		
		if let _value = value {
			self.nameLabel.text =  _value.name
			self.userImageView.image = UIImage(named: _value.imageName)
		}
		
	}
	
}
