//
//  SYCollectionViewHelp.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/30.
//

import UIKit
typealias SYCollectionCellClickHandle = (IndexPath,Any)->Void
typealias SYCollectionCellConfigHandle = (IndexPath,Any,UICollectionViewCell)->Void

class SYCollectionViewHelp: NSObject {
	var dataSource : [Any]?
	var cellID = ""
	var clickHnadle: SYCollectionCellClickHandle?
	var configHandle: SYCollectionCellConfigHandle?
	
	//数据为空的时候的占位视图
	lazy var emptyView:UIView = {
		emptyViewImageView.image = emptyDataIcon.ssy.toImage()
		emptyViewImageView.contentMode = .scaleAspectFill
		$0.addSubview(emptyViewImageView)
		emptyViewImageView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		return $0
	}(UIView.init())
	var emptyViewImageView:UIImageView = UIImageView.init()
	//是否展示占位视图
	var showEmpty : Bool = false
	//空数据占位图的图标
	var emptyDataIcon:String = "Icon_noData" {
		didSet {
			emptyViewImageView.image = emptyDataIcon.ssy.toImage()
		}
	}
	
	weak var collView:UICollectionView?
	
	func refreshing(models:[Any]?)  {
		self.dataSource = models
		collView?.ssy.endRefreshing()
		collView?.reloadData()
	}
	func loadMore(models:[Any]?)  {
		self.dataSource?.append(contentsOf: models ?? [])
		collView?.ssy.endLoadMore()
		collView?.reloadData()
	}
	
	deinit {
		syprint("SYUICollectionViewHelp deinit")
	}
}
// MARK: - 帮助类扩展 UITableViewDelegate
extension SYCollectionViewHelp:UICollectionViewDelegate
{
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	let model = dataSource?[indexPath.row]
	clickHnadle?(indexPath,model!)
}
}
// MARK: - 帮助类扩展 UITableViewDataSource
extension SYCollectionViewHelp:UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
	collectionView.mj_footer?.isHidden = dataSource?.count == 0
	self.showEmptyWithDataSource(dataSource: dataSource)
	return dataSource?.count ?? 0
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
	var cell:UICollectionViewCell
	let model = dataSource?[indexPath.row]
	if let model = model as? BaseCellLayoutModel ,model.cellID.count > 0{
		cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellID, for: indexPath)
	}else{
		cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
	}
	if let bcell = cell as? SYBaseCollectionCell{
		bcell.configModel(model: model as? SYBaseModel)
	}
	configHandle?(indexPath,model!,cell)
	return cell
}



}
extension SYCollectionViewHelp {
func showEmptyWithDataSource(dataSource:[Any]?,collection:UICollectionView? = nil)  {
	guard showEmpty else {
		emptyView.isHidden = true
		return
	}
	guard (dataSource?.count ?? 0) <= 0 else {
		emptyView.isHidden = true
		return
	}
	emptyView.isHidden = false
	if emptyView.superview != nil {
		return;
	}
	if let tableView = self.collView  {
		tableView.addSubview(emptyView)
		emptyView.snp.makeConstraints { (make) in
			make.centerX.equalTo(tableView)
			make.top.equalToSuperview()
			make.width.equalTo(tableView).offset(-150)
			make.height.equalTo(emptyView.snp.width)
		}
	}else if let tableView = collection {
		tableView.addSubview(emptyView)
		emptyView.snp.makeConstraints { (make) in
			make.centerX.equalTo(tableView)
			make.top.equalToSuperview()
			make.width.equalTo(tableView).offset(-150)
			make.height.equalTo(emptyView.snp.width)
		}
	}
	
	
}
}
extension SSYHelp where Base: UICollectionView
{
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
