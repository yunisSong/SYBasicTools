//
//  UIFontConfig.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/3.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

extension UIFont {
    // MARK: - 页面、导航栏相关
   	open class var viewNavgationTitleFont: UIFont { return UIFont.boldSystemFont(ofSize: 18) }
    /// 导航栏按钮字体
   	open class var viewNavgationBarFont: UIFont { return UIFont.systemFont(ofSize: 14) }
	/// 分页标签字体
   	open class var tagHeadTitleFont: UIFont { return UIFont.systemFont(ofSize: 16) }
	/// 页面按钮、菜单字体
   	open class var itemCellTitleFont: UIFont { return UIFont.systemFont(ofSize: 14) }


    // MARK: - tableview section 相关
    /// section 标题字体
   	open class var sectionTitleFont: UIFont { return UIFont.boldSystemFont(ofSize: 18) }
    /// section 内容字体
   	open class var sectionContentFont: UIFont { return UIFont.systemFont(ofSize: 16) }

    // MARK: - tableview cell 相关
	open class var cellTitleFont: UIFont { return UIFont.boldSystemFont(ofSize: 18) }
	open class var tabeleListFont: UIFont { return UIFont.systemFont(ofSize: 17) }

	/// cell 内容字体
	open class var cellContentFont: UIFont { return UIFont.systemFont(ofSize: 15) }
	/// cell 说明字体
	open class var cellInstructionsFont: UIFont { return UIFont.systemFont(ofSize: 15) }

	open class var cellDesTitleFont: UIFont { return UIFont.systemFont(ofSize: 13) }

}
