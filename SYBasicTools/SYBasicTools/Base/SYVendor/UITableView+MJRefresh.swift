//
//  UITableView+mjrefresh.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import UIKit
import MJRefresh
// 方便后续替换
extension SSYHelp where Base: UITableView {
	var sy_header:MJRefreshHeader? {
		return self.base.mj_header
	}
	
	func creatHeader(_ handle:@escaping ()->Void)  {
		self.base.mj_header = MJRefreshNormalHeader.init(refreshingBlock:handle)
	}
	
	var sy_footer:MJRefreshFooter? {
		return self.base.mj_footer
	}
	func creatFooter(_ handle:@escaping ()->Void)  {
		self.base.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: handle)

	}
}
