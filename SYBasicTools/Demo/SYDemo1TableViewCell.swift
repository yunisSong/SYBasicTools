//
//  SYDemo1TableViewCell.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import UIKit

class SYDemo1TableViewCell: SYBaseCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	override func configModel(model: SYBaseModel?) {
		super.configModel(model: model)
		guard let model = model as? BaseCellLayoutModel else {
			return
		}
		self.textLabel?.text = model.leftString_1
		self.textLabel?.textColor = model.leftColor
	}
}
