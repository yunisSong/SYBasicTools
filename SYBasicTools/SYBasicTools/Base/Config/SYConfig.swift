//
//  SYConfig.swift
//  SSYTool
//
//  Created by Yunis on 2021/3/15.
//  Copyright © 2021 Yunis. All rights reserved.
//

import UIKit

// MARK: - 页面边距
var SYDefaultIntervalOffsetX = CGFloat(40)

var SYDefaultViewOffset = CGFloat(15)
var SYDefaultViewTopOffset = CGFloat(8)

var SYDefaultViewRadius = CGFloat(5)
var SYDefaultTextViewOffset = CGFloat(8)
var SYDefaultSearchViewHeight = CGFloat(54)
func SYDefaultSearchViewHeight(_ showRightView:Bool = true) -> CGFloat {
	if showRightView {
		return CGFloat(50)
	}else {
		return CGFloat(54)
	}
}
var filtrateMenuViewHeight =  CGFloat(62)
/** 状态栏高度 */
var SYStatusHeight:CGFloat = {
	var staus = UIApplication.shared.statusBarFrame
	return staus.height
}()

/** 是否底部有操作条 */
var haveSafeBottom :Bool = {
	if SYStatusHeight > 20
	{
		return true
	}else {
		return false
	}
}()
/** 屏幕宽 */
var SCREEN_WIDTH:CGFloat = {
	var staus = UIScreen.main.bounds.width
	return staus
}()

/** 屏幕高 */
var SCREEN_HEIGHT:CGFloat = {
	var staus = UIScreen.main.bounds.height
	return staus
}()


// MARK: 通用协议
/* 是否选中的协议 */
protocol SelectStateProtocol {
	var selectState:Bool {get set}
}

// MARK: - 常用参数
//字符串中多个值的分隔符
var separatorOfMultipleValues:String = ";"
var YES = true
var NO = false
var SYDefaultHTTPErrorMessage = "后台服务异常，请联系管理员！"
var SYPushDeviceToken = "SYPushDeviceToken"
/* 动画时间 */
var SYDefaultAnimationDuration = 0.35
var SYHUDShowDuration:Double = 2.0


// MARK: - 发送通知
func sy_postNotification(name:String,object:Any? = nil) {
	NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: object)
}
func sy_addNotificationObserver(observer:Any,selector:Selector,name:String) {
	NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: name), object: nil)
}

// MARK: - 通知名称

var Notification_ShowLoginCtr = "Notification_ShowLoginCtr"
var Notification_ShowMainCtr = "Notification_ShowMainCtr"
//显示已完成工单页面
var Notification_ShowCompletedOrder = "Notification_ShowCompletedOrder"
//显示未完成工单页面
var Notification_ShowNotCompletedOrder = "Notification_ShowNotCompletedOrder"
//消息数目发生了改变
var Notification_SystemMsgCntChange = "Notification_SystemMsgCntChange"
//用户头像发生了改变
var Notification_UserHeadPortraitChange = "Notification_UserHeadPortraitChange"
//工单数量发生变化
var Notification_OrderCountChange = "Notification_OrderCountChange"

// MARK: - key

var isShowWelcome = "SY_isShowWelcome"

func sy_setValue(value: Any?,key:String)  {
	UserDefaults.standard.setValue(value, forKey: key)
	UserDefaults.standard.synchronize()
}
func sy_value(key:String) -> Any?  {
	return UserDefaults.standard.value(forKey: key)
}
