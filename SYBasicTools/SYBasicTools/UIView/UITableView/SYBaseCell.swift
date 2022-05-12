//
//  SYBaseCell.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import UIKit

class SYBaseCell: UITableViewCell {
	var cellModel:SYBaseModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	func configModel(model:SYBaseModel?)  {
	}

}
