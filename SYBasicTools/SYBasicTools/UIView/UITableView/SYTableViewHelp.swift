//
//  SYTableViewHelp.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//
import UIKit
typealias SYCellClickIndexHandle = (IndexPath)->Void
typealias SYCellClickHandle = (IndexPath,Any)->Void
typealias SYCellConfigHandle = (IndexPath,Any,UITableViewCell)->Void


class SYTableViewHelp: NSObject {
	// MARK: - 空数据占位视图
	var showEmptyPlaceholderView :Bool = true
	var emptyViewImageView:UIImageView = UIImageView.init()
	var placeholderIcon: String = "Icon_noData" {
		didSet {
			emptyViewImageView.image = placeholderIcon.ssy.toImage()
		}
	}
	lazy var emptyView:UIView = UIView.init().then {
		$0.addSubview(emptyViewImageView)
	}
	
	// MARK: - 数据源
	weak var tab:UITableView?
	var dataSource:[Any]? {
		didSet {
			dataSource?.forEach({ (model) in
				guard let model = model as? BaseCellLayoutModel else {
					return
				}
				self.tab?.ssy.ssy_register(model.cellID)
			})
		}
	}
	var cellID = ""
	var clickHnadle: SYCellClickHandle?
	var clickIndexHnadle: SYCellClickIndexHandle?
	var configHandle: SYCellConfigHandle?
	
	
	func refreshing(models:[Any]?)  {
		self.dataSource = models
		self.tab?.ssy.endRefreshing()
		tab?.reloadData()
	}
	func loadMore(models:[Any]?)  {
		self.dataSource?.append(contentsOf: models ?? [])
		self.tab?.ssy.endLoadMore()
		tab?.reloadData()
	}
	deinit {
		syprint("SYTableViewHelp deinit")
	}
	
}

// MARK: - 帮助类扩展 UITableViewDelegate
extension SYTableViewHelp:UITableViewDelegate
{
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	let model = dataSource?[indexPath.row]
	clickHnadle?(indexPath,model!)
	clickIndexHnadle?(indexPath)
}
}
// MARK: - 帮助类扩展 UITableViewDataSource
extension SYTableViewHelp:UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	tableView.mj_footer?.isHidden = dataSource?.count == 0
	self.showEmptyWithDataSource(dataSource: dataSource)
	return dataSource?.count ?? 0
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	var cell:UITableViewCell
	let model = dataSource?[indexPath.row]
	if let model = model as? BaseCellLayoutModel ,model.cellID.count > 0{
		cell = tableView.dequeueReusableCell(withIdentifier: model.cellID, for: indexPath)
	}else{
		cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
	}
	cell.selectionStyle = .none
	if let cell = cell as? SYBaseCell,let model = model as? SYBaseModel {
		cell.configModel(model: model)
	}
	configHandle?(indexPath,model!,cell)
	return cell
}
}
// MARK: - 数据为空时显示占位视图
extension SYTableViewHelp {
func showEmptyWithDataSource(dataSource:[Any]?)  {
	guard showEmptyPlaceholderView else {
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
	if let tableView = self.tab {
		tableView.addSubview(emptyView)
		emptyView.ssy_snp.makeConstraints { (make) in
			make.centerX.equalTo(tableView)
			make.top.equalTo(tableView).offset(62)
			make.width.equalTo(tableView).offset(-150)
			make.height.equalTo(emptyView.ssy_snp.width)
		}
	}
	
}
}

extension UITableView {
	private static var syHelp:Void?
	private static var syData:Void?

	var help:SYTableViewHelp{
		
		get {
			// 使用关联数据获取
			let hl = objc_getAssociatedObject(self, &(Self.syHelp))
			if let hl = hl as? SYTableViewHelp {
				return hl
			}
			let help = SYTableViewHelp()
			self.help = help
			return help
		}
		set {
			// 使用关联数据绑定
			objc_setAssociatedObject(self,&(Self.syHelp), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}
	var sy_data:Any? {
		
		get {
			// 使用关联数据获取
			let hl = objc_getAssociatedObject(self, &(Self.syData))
			return hl
		}
		set {
			// 使用关联数据绑定
			objc_setAssociatedObject(self,&(Self.syData), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}
}
