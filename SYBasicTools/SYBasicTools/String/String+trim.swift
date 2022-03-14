//
//  String+trim.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/3/13.
//

import Foundation
extension String:SSYCompatible{}
extension SSYHelp where Base == String {
    enum SYTrimType {
        case headEnd;
        case head;
        case end;
        case all;
    }
    
    /// 去除字符串中的空格
    /// - Parameter type: 去除的类型
    /// - Returns: 去除后的字符串
    func trim(_ type:SYTrimType = .headEnd) -> String {
        var str = self.base
        switch type {
            
        case .headEnd:
            return str.trimmingCharacters(in: CharacterSet.whitespaces)
        case .head:
            var firstChar = str.first
            while firstChar == " "  {
                str.removeFirst()
                firstChar = str.first
            }
            return str
        case .end:
            var lastChar = str.last
            while lastChar == " " {
                str.removeLast()
                lastChar = str.last
            }
            return str
        case .all:
            return str.replacingOccurrences(of: " ", with: "")
       
        }
        
    }
    
    
    /// 字符串指定个数的空格开头
    /// - Parameter num: 空格个数
    /// - Returns: 添加空格后的字符串
    func beginSpaceNum(num:Int) -> String {
        guard num >= 0 else {
            return self.base
        }
        let str = self.trim(.head)
        var space = ""
        for _ in 0..<num {
            space += " "
        }
        return space + str
        
    }
    
    
}
