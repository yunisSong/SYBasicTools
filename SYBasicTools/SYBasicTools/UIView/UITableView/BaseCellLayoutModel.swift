//
//  BaseCellLayoutModel.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import UIKit

class BaseCellLayoutModel: SYBaseModel {
	
	//MARK: - 通讯相关
	var postKey = ""
	var postValue :Any? {
		didSet {
//			setNetParameters()
		}
	}
	//当选择一个数据是，需要通讯多个参数时的特殊处理
	var postDic :[String:Any]?
	//选择的图片
//	var imageList :[ShowImageModel]?

	//MARK: - 布局相关
//	var cellType = CellLayoutType.textField
	//cell class
	var cellID = ""
	//是否可编辑
	var canEdit = false
	//是否展示编辑状态
	var showEditState = false
	//是否 隐藏尾部图片
	var hiddenEndIcon = false
	//是否为必选项 前面加红色※
	var must = true
	//用于某些u页面需要i隐藏特定的视图
	var optionViewHidden = false
	//目前仅用在 工单表示是否是单选
	var radioSelect = false
	//目前仅用在 工单处理中表示需要单独刷新。
	var isRefreshCell = false
	
	//键盘类型
//	var textfieldInputType = UIKeyboardType.default
//	var inputTextValueType :InputType = .normal

	var heightConstraint :CGFloat = 0 // 用来修改某些页面的高度 一般用来设置间隔 或者分割线是否到边
	var topOffsetConstraint :CGFloat = -999 // 用来修改某些页面的高度 一般用来设置间隔
	var bottomOffsetConstraint :CGFloat = -999 // 用来修改某些页面的高度 一般用来设置间隔

	var subTableView:UITableView? // cell 里面包含有 子 UITableView，这里是为了统计里面的通讯数据

	//MARK: - 页面元素
	var leftString_1 = ""
	var leftString_2 = ""
	var leftString_3 = ""
	var rightString_1 = ""
	var rightString_2 = ""
	var rightString_3 = ""
	var actionItems:[Any] = []
	var optionlString = "请输入"
	
	var contentBGColor : UIColor = .white
	var inputBGColor : UIColor = .white

	var leftColor : UIColor = .cellTitleColor
	var leftColor_2 : UIColor = .cellContentColor
	var leftColor_3 : UIColor = .cellInstructionsColor
	
	var rightColor : UIColor = .cellTitleColor
	var rightColor_2 : UIColor = .cellContentColor
	var rightColor_3 : UIColor = .cellInstructionsColor
}
