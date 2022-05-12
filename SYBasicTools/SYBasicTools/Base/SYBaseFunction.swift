//
//  SYBaseFunction.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import Foundation
/* 日志打印 */
func syprint(file:NSString = #file,line:Int = #line,fn:String = #function,_ items: Any...) {
	#if DEBUG
	var fileSting = file.lastPathComponent
	while fileSting.count < 25 {
		fileSting = fileSting + "_"
	}
	var fnSting = fn
	while fnSting.count < 25 {
		fnSting = fnSting + "_"
	}
	let prefix = "\(fileSting)_\(line)_\(fnSting):"
	print(prefix,items)
	
	#endif
}
