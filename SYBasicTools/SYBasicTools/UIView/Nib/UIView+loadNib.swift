//
//  UIView+load.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/13.
//

import UIKit
extension SSYHelp where Base: UIView {
	static func loadViewWithNib(_ xib:String? = nil) -> Base?{
		let name = xib == nil ? "\(Base.self)" : xib!
		syprint(name)
		let view  = Bundle.main.loadNibNamed("\(name)", owner: nil, options: nil)?.last
		return view as? Base
	}
}

