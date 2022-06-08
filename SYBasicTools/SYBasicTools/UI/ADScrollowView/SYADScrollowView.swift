//
//  SYADScrollowView.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/31.
//

import UIKit
/*
1. 传入数组，数组的model 包括 图片链接（或者本地图片）
2. 可设置间隔、自动滚动时间间隔、圆角、阴影、展示图片宽高数据
3.

*/
protocol SYADScrollowModelProtocol {
	var imageURL:String?{get set}
	var imageName:String?{get set}
	
}
class SYADScrollowView: UIView {
	
	var autoScrollow:Bool = true
	var scrollowDuration:Float = 0.5
	var scrollowInterval:Float = 0.5
	var canLoop:Bool = false
	var clickHnadle: ((Int,SYADScrollowModelProtocol)->Void)?
	var configHandle: SYCollectionCellConfigHandle?
	
	private var models:[SYADScrollowModelProtocol]? {
		didSet {
			//刷新页面
			adCollectionView?.reloadData()
		}
	}
	private var itemSize:CGSize = .zero
	private var adCollectionView:UICollectionView?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .lightGray
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	func config(cellType:String = "SYADCell",models:[SYADScrollowModelProtocol]?,itemWidth:CGFloat,itemHeigth:CGFloat,lineSpacing:CGFloat = 5.0,itemSpacing:CGFloat = 5.0)  {
		let layout = SYADMiddleLayout.init(itemSize: CGSize.init(width: itemWidth, height: itemHeigth))
		layout.minimumLineSpacing = lineSpacing
		layout.minimumInteritemSpacing = itemSpacing
		layout.sectionInset = .init(top: lineSpacing, left: itemSpacing, bottom: lineSpacing, right: itemSpacing)
		adCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
		adCollectionView?.backgroundColor = .white
		if var adCollectionView = adCollectionView {
			adCollectionView.showsVerticalScrollIndicator = false
			adCollectionView.showsHorizontalScrollIndicator = false
			self.addSubview(adCollectionView)
			adCollectionView.ssy_snp.makeConstraints { (make) in
				make.leading.trailing.equalToSuperview()
				make.top.bottom.equalToSuperview()
				make.height.greaterThanOrEqualTo((lineSpacing * 2) + itemHeigth)
			}
			adCollectionView.ssy.addHelp { (help) in
				help.cellID = cellType
				help.dataSource = models
				help.clickHnadle = {
					[weak self] index,model in
					self?.clickCell(indexPath: index, model: model)
				}
				help.configHandle = {
					[weak self] index,model,cell in
					self?.configCell(indexPath: index, model: model, cell: cell)
				}
			}

		}
	}
	
	

}

extension SYADScrollowView {
	func clickCell(indexPath:IndexPath,model:Any)  {
		if let model = model as? SYADScrollowModelProtocol {
			//点击事件回调
			clickHnadle?(indexPath.row,model)
		}
		//滚动到中间
		self.adCollectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
	func configCell(indexPath:IndexPath,model:Any,cell:UICollectionViewCell)  {
		if let cell = cell as? SYADCell,let model = model as? SYADScrollowModelProtocol {
			cell.configModel(model: model)
		}
		//特殊设置视图
		configHandle?(indexPath,model,cell)
	}
}
