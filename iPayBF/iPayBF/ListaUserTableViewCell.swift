//
//  ListaUserTableViewCell.swift
//  iPayBF
//
//  Created by Alexandre Cardoso on 22/02/21.
//

import UIKit

class ListaUserTableViewCell: UITableViewCell {
	
	static let identifier: String = "ListaUserTableViewCell"
	
	@IBOutlet weak var imageUserImageView: UIImageView!
	@IBOutlet weak var nomeUserLabel: UILabel!
	@IBOutlet weak var cartaoImageView: UIImageView!
	
	
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	func configCell(user: Usuario) {
		self.imageUserImageView.image = user.imageUser
		self.nomeUserLabel.text = user.nome
		self.cartaoImageView.image = user.cartao
	}

	
}
