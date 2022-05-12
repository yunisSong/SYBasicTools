//
//  UIColorConfig.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/3.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

// MARK: - 背景颜色
extension UIColor {
	//状态默认背景颜色 按钮背景 选中背景
	open class var defaultStateColor: UIColor { return UIColor.init("#026EFF") }// 蓝色
	open class var redStateColor: UIColor { return UIColor.init("#FF4D6B") }// 蓝色
	open class var yelloStateColor: UIColor { return UIColor.init("#FFA828") }// 蓝色

	open class var defaultStateUnselectColor: UIColor { return UIColor.init("#026EFF4D") }// 蓝色

    //页面背景色 #FAFAFC  F0F1F5
	@objc open class var viewBGColor: UIColor { return UIColor.init("#F0F1F5") } // 0.0 灰色
	@objc open class var viewLightBGColor: UIColor { return UIColor.init("#FAFAFC") } // 0.0 灰色

	open class var lineViewBGColor: UIColor { return UIColor.init("#E6E9F0") } // 0.0 灰色
	open class var viewBorderColor: UIColor { return UIColor.init("#CED4E0") } // 0.0 灰色
    //表格背景色
	open class var tableBGColor: UIColor { return UIColor.white } // 0.0 white
    //表格 section 背景色
	open class var sectionBGColor: UIColor { return UIColor.white } // 0.0 white
    //表格 cell 背景色
	open class var cellBGColor: UIColor { return UIColor.white } // 0.0 white
    //表格 cell 分割视图背景色
	open class var cellSplitBGColor: UIColor { return UIColor.init("#F0F1F5") } // 0.0 white
	open class var buttonBGColor: UIColor { return UIColor.white } // 0.0 white
}
// MARK: - 字体颜色
extension UIColor {
    // MARK: - 页面、导航栏相关
	//通用文本黑色
	@objc open class var textBlackColor: UIColor { return UIColor.init("#2C3340") } // 0.0 white
	
	//通用文本灰色
	open class var textGrayColor: UIColor { return UIColor.init("#646D7F") } // 0.0 white
	
	//通用文本说明m文字颜色
	open class var textDesColor: UIColor { return UIColor.init("#B1B8C7") } // 0.0 white

	open class var maskLayerColor: UIColor { return UIColor.init("#00000066") } // 0.0 white

    /// 页面标题文字颜色
	open class var viewNavgationTitleColor: UIColor { return UIColor.init("#2C3340") } // 黑色
    /// 导航栏按钮字体颜色
	open class var viewNavgationBarColor: UIColor { return UIColor.black } // 0.0 white
	// 分页标签字体
   	open class var tagHeadTitleColor: UIColor { return UIColor.init("#2C3340")} // 黑色 选中
   	open class var tagHeadTitleUnselectColor: UIColor { return UIColor.init("#646D7F")} // 黑色 未选中

    // MARK: - tableview section 相关
    /// section 标题字体颜色
	open class var sectionTitleColor: UIColor { return UIColor.init("#2C3340") } // 0.0 white
    /// section 内容字体颜色
	open class var sectionContentColor: UIColor { return UIColor.init("#646D7F") } // 0.0 white
    
    // MARK: - tableview cell 相关
    /// cell 标题字体颜色
	open class var cellTitleColor: UIColor { return UIColor.init("#2C3340") } // 0.0 white

    /// cell 内容字体颜色
	open class var cellContentColor: UIColor { return UIColor.init("#646D7F") } // 0.0 white

    /// cell 说明字体颜色
	open class var cellInstructionsColor: UIColor { return UIColor.init("#B1B8C7") } // 0.0 white

}
// MARK: - 16进制
