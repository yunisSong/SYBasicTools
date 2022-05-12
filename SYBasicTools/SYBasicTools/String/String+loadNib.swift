//
//  String+loadXIB.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/3/14.
//

import UIKit
extension SSYHelp where Base == String
{
	func ssy_nib() -> UINib? {
		if self.base.count == 0 {
			return nil
		}
		return UINib.init(nibName: self.base, bundle: nil)
	}

}
