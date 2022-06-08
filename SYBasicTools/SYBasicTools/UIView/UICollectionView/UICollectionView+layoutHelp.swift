//
//  UICollectionView+layoutHelp.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/31.
//

import UIKit
extension UICollectionView {
	private static var syHelp:Void?
	var help:SYCollectionViewHelp{
		
		get {
			// 使用关联数据获取
			let hl = objc_getAssociatedObject(self, &(Self.syHelp))
			if let hl = hl {
				return hl as! SYCollectionViewHelp
			}
			let help = SYCollectionViewHelp()
			self.help = help
			return help
		}
		set {
			// 使用关联数据绑定
			objc_setAssociatedObject(self,&(Self.syHelp), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}
}

extension SSYHelp where Base: UICollectionView {
	
	mutating func addHelp(help:(SYCollectionViewHelp)->Void)  {
		
		self.configuration()
		self.base.help.collView = self.base
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

		
	}
	
	
}
