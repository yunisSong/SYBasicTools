//
//  UILabel+config.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/10.
//  Copyright © 2021 Yunis. All rights reserved.
//

import Foundation
import UIKit
extension UILabel {
	class func configCell(font:UIFont,textColor:UIColor,bgColor:UIColor = .clear) -> UILabel {
		let label = UILabel.init()
		label.config(font: font, textColor: textColor,bgColor: bgColor)
		return label
	}
	class func cellTitleLabel() -> UILabel {
		let label = UILabel.init()
		label.configCellTitle()
		return label
	}
	class func cellContentLabel() -> UILabel {
		let label = UILabel.init()
		label.configCellContent()
		return label
	}
	class func cellContentLabelBlack() -> UILabel {
		let label = UILabel.init()
		label.configCellContentBlack()
		return label
	}
	class func cellDesLabel() -> UILabel {
		let label = UILabel.init()
		label.configCellDes()
		return label
	}
	func configCellTitle()  {
		self.config(font: .cellTitleFont, textColor: .cellTitleColor)
	}
	func configCellContent()  {
		self.config(font: .cellContentFont, textColor: .cellContentColor)
	}
	func configCellContentBlack()  {
		self.config(font: .cellContentFont, textColor: .cellTitleColor)
	}
	func configCellDes()  {
		self.config(font: .cellInstructionsFont, textColor: .cellInstructionsColor)
	}
	func configState()  {
		self.config(font: .cellContentFont, textColor: .defaultStateColor)
	}
	func configRedState()  {
		self.config(font: .cellContentFont, textColor: .redStateColor)
	}
	func configYellowState()  {
		self.config(font: .cellContentFont, textColor: .yelloStateColor)
	}
	func configMenuTitle()  {
		self.config(font: .viewNavgationTitleFont, textColor: .cellTitleColor)
	}
	func configMenuItemTitle()  {
		self.config(font: .cellTitleFont, textColor: .cellTitleColor)
	}
	func config(font:UIFont,textColor:UIColor,bgColor:UIColor = .clear)  {
		self.font = font
		self.textColor = textColor
		self.backgroundColor = bgColor;
	}
}
