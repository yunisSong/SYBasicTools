//
//  SYGetClassName.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import Foundation

extension NSObject {
	class func className() -> String {
		var classStr = String(describing: Self.Type.self)
		classStr = classStr.replacingOccurrences(of: ".Type", with: "")
		print("className = ",classStr)
		return classStr
	}
}
