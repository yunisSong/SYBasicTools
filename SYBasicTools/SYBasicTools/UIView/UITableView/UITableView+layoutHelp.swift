//
//  UITableView+layoutHelp.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import UIKit
extension SSYHelp where Base: UITableView {
	
	mutating func addHelp(help:(SYTableViewHelp)->Void)  {
		
		self.configuration()
		self.base.help.tab = self.base
		self.base.delegate = self.base.help
		self.base.dataSource = self.base.help
		help(self.base.help)
		self.base.ssy.ssy_register(self.base.help.cellID)
		self.base.help.dataSource?.forEach { model in
			guard let model = model as? BaseCellLayoutModel else {
				return
			}
			syprint(model)
			self.base.ssy.ssy_register( model.cellID)
		}
	}
	/// 统一设置 tableview 样式
	private func configuration()  {
		self.base.separatorStyle = .none
//		self.base.backgroundColor = .viewBGColor
	}
	
	
}
extension SSYHelp where Base: UITableView {
	func beginRefreshing()  {
		self.sy_header?.beginRefreshing()
	}
	func refreshingBlock(_ handle:@escaping ()->Void) {
		self.creatHeader(handle)
	}
	func endRefreshing()  {
		self.sy_header?.endRefreshing()
	}

	func beginLoadMore()  {
		self.sy_footer?.beginRefreshing()
	}
	func loadMoreBlock(_ handle:@escaping ()->Void) {
		self.creatFooter(handle)
	}
	func endLoadMore()  {
		self.sy_footer?.endRefreshing()
	}
}



