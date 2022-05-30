//
//  String2URL.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/30.
//

import UIKit
extension SSYHelp where Base == String {
	var urlValue:URL? {
		get {
			let eco = self.base.ssy.urlString ?? ""
			return URL.init(string: eco)
		}
	}
	var urlString:String? {
		get {

			var eco = self.base.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
			if eco.last == ";" {
				eco.removeLast()

			}
			return eco
		}
	}
}
