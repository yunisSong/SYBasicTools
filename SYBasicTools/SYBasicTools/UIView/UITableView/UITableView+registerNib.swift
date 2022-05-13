//
//  UITableView+registerNib.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import UIKit
extension SSYHelp where Base :UITableView
{
	func ssy_register(_ nib:String)  {
		guard !nib.isEmpty else {
			return;
		}
		self.base.register(nib.ssy.ssy_nib(), forCellReuseIdentifier: nib)
	}
	func ssy_registerClass(_ cellClass:String)  {
		guard !cellClass.isEmpty else {
			return;
		}
		self.base.register(NSClassFromString(cellClass), forCellReuseIdentifier: cellClass)
	}
	
}
