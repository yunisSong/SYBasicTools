//
//  SYImageListCollectionViewCell.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/30.
//

import UIKit

class SYImageListCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var topConstraint: NSLayoutConstraint!
	@IBOutlet weak var rightConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var baseView: UIView!
	@IBOutlet weak var imageVIew: UIImageView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	

}
