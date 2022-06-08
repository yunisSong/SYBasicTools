//
//  UIImageView+Kingfisher.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/31.
//

import UIKit
import Kingfisher
extension UIImageView {
	var ssy_kf: KingfisherWrapper<UIImageView> {
		get {
			self.kf
		}
	}
}
