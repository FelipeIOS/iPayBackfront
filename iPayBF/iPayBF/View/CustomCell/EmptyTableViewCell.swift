//
//  EmptyTableViewCell.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 01/03/21.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
	
	static let identifier: String = "EmptyTableViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	
}
