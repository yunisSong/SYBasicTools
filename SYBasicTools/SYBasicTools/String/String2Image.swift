//
//  String2Image.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/3/13.
//

import UIKit

extension SSYHelp where Base == String {
    func toImage() -> UIImage? {
        guard self.base.count > 0 else {
            return nil
        }
        return UIImage.init(named: self.base)
    }
}
