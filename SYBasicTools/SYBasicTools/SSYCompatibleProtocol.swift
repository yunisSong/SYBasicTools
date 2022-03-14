//
//  SSYCompatibleProtocol.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/3/13.
//

import Foundation
struct SSYHelp<Base>{
    let base: Base
    init(_ base:Base) {
        self.base = base
    }
}

protocol SSYCompatible {
    
}

extension SSYCompatible {
    static var ssy:SSYHelp<Self>.Type {
        get{SSYHelp<Self>.self}
        set{}
    }
    
    var ssy:SSYHelp<Self> {
        get{SSYHelp(self)}
        set{}
    }
    static var SSY:SSYHelp<Self>.Type {
        get{SSYHelp<Self>.self}
        set{}
    }
    
    var SSY:SSYHelp<Self> {
        get{SSYHelp(self)}
        set{}
    }
}
