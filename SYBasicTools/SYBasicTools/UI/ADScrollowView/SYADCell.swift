//
//  SYADCell.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/31.
//

import UIKit

class SYADCell: UICollectionViewCell {

	@IBOutlet weak var baseView: UIView!
	@IBOutlet weak var imageView: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		imageView.backgroundColor = .viewBGColor
    }
	
	func configModel(model:SYADScrollowModelProtocol)  {
		if let url = model.imageURL {
			imageView.ssy_kf.setImage(with: url.ssy.urlValue)
		}else if let imageName = model.imageName {
			imageView.image = imageName.ssy.toImage()
		}
	}
	
}
