//
//  BaseTableViewController.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import UIKit
typealias requestDataHandle = ([Any]?)->Void
protocol BaseTableViewMustMethod {
	func loadNewData(handle:@escaping requestDataHandle) -> Void
	func loadMoreData(handle:@escaping requestDataHandle) ->Void
	func cellClickEvent(_ index:IndexPath,_ model:Any)
}

typealias BaseTableViewCtr = BaseTableViewController & BaseTableViewMustMethod

class BaseTableViewController: SYBaseViewController {
	// MARK: - parameter property
	// MARK: - 按钮视图 默认没有。
	var showButtonType:ShowButtonType = .None {
		didSet {
			updateSeatchViewConstraint()
		}
	}
	var leftButtonTitle:String = "" {
		didSet {
			leftButton.setTitle(leftButtonTitle, for: .normal)
		}
	}
	lazy var leftButton:RoundButton = {
		$0.layer.cornerRadius = 25
		$0.backgroundColor = .defaultStateColor
		$0.titleLabel?.font = .cellTitleFont
		$0.setTitleColor(.white, for: .normal)
		$0.addTarget(self, action: #selector(leftClick), for: .touchUpInside)
		return $0
	}(RoundButton.init(frame: .zero))
	var rightButtonTitle:String = "" {
		didSet {
			rightButton.setTitle(rightButtonTitle, for: .normal)
		}
	}
	lazy var rightButton:RoundButton = {
		$0.layer.cornerRadius = 25
		$0.backgroundColor = .viewBGColor
		$0.titleLabel?.font = .cellTitleFont
		$0.setTitleColor(.cellContentColor, for: .normal)
		$0.layer.borderColor = UIColor.textDesColor.cgColor
		$0.addTarget(self, action: #selector(rightClick), for: .touchUpInside)
		return $0
	}(RoundButton.init(frame: .zero))
	
	
	// MARK: - 网络请求通用的参数

	//自动刷新
	var autoRefresh = true
	// 当前页面
	var pageIndex = 0;
	// 请求数据页码
	var requestPageIndex = 0;
	//请求数据条数
	var pageSize = 10;
	// 搜索框
	var searchView :SeacrchInputView = {
		var head = SeacrchInputView.ssy.loadViewWithNib()

		return head!
	}()
	// MARK: - 列表相关
	var tableView = UITableView.init(frame: .zero, style: .plain)
	var cellType:String = "" {
		didSet {
			tableView.ssy.ssy_register(cellType)
			tableView.help.cellID = cellType
		}
	}
	// MARK: - 列表与页面的间距，方便后续在列表上方和底部添加视图
	var scrollViewTopOffset : CGFloat = SYDefaultViewTopOffset {
		didSet {
			updateSeatchViewConstraint()
		}
	}
	var searchViewTopOffset : CGFloat = SYDefaultViewTopOffset {
		didSet {
			updateSeatchViewConstraint()
		}
	}
	var scrollViewBottomOffset : CGFloat = SYDefaultViewTopOffset {
		didSet {
			updateSeatchViewConstraint()
		}
	}
	// MARK: - --- Class ---
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	func loadSubViews() {
		//配置 tableview
		tableView.ssy.addHelp { [weak self](help) in
			help.cellID = self?.cellType ?? ""
			help.clickHnadle = { index,model in
				self?.cellClickEvent(index,model)
			}
			help.configHandle = { index,model,cell in
				self?.configCell(index, model, cell)
			}
		}
		view.addSubview(searchView)
		view.addSubview(tableView)
		view.addSubview(leftButton)
		view.addSubview(rightButton)
		updateSeatchViewConstraint()
		addMJ()
	}
	func withoutMJ()  {
		tableView.mj_footer = nil;
		tableView.mj_header = nil;
	}
	func addMJ()  {
		//配置 刷新和加载更多
		tableView.ssy.refreshingBlock {
			[weak self] in
			self?.afterRefresh()
		}
		tableView.ssy.loadMoreBlock{
			[weak self] in
			self?.afterLoadMore()
		}
	}
	func beginRefresh()  {
		tableView.ssy.beginRefreshing()
	}

	// MARK: - Network Methods && Target Methods
	//网络请求 && 点击事件
	func afterRefresh(){
		requestPageIndex = 0
		self.loadNewData { [weak self] (model) in
			self?.tableView.help.refreshing(models: model)
			// 默认起始页为 0  这里是刷新后的页码
			if let model = model ,
			   model.count > 0 {
				self?.pageIndex = (self?.requestPageIndex ?? 0) + 1
			}
			
		}
		
	}
	func afterLoadMore(){
		requestPageIndex = pageIndex
		self.loadMoreData { [weak self] (model) in
			self?.tableView.help.loadMore(models: model)
			if let model = model ,
			   model.count > 0 {
				self?.pageIndex = (self?.requestPageIndex ?? 0) + 1
			}
		}
	}

}
extension BaseTableViewController {
	@objc func leftClick()  {
		
	}
	@objc func rightClick()  {
		
	}
}
extension BaseTableViewController {
	func updateSeatchViewConstraint()  {
		
//		switch showButtonType {
//		case .None:
//			layoutNoneButtonView()
//		case .SingleButtonView(title:let title):
//			leftButtonTitle = title
//			layoutSingleButtonView()
//		case .LeftRigthtButtonView(leftTitle: let leftTitle, rightTitle:let rightTitle):
//			leftButtonTitle = leftTitle
//			rightButtonTitle = rightTitle
//			layoutLeftRigthtButtonView()
//		case .TopBottomButtonView(topTitle:let topTitle, bottomTitle:let bottomTitle):
//			leftButtonTitle = topTitle
//			rightButtonTitle = bottomTitle
//			layoutTopBottomButtonView()
//		}
//		searchView.isHidden = !showSearchView
//		searchView.snp.remakeConstraints { (make) in
//			make.left.right.equalToSuperview()
//			make.top.equalTo(self.view).offset(searchViewTopOffset)
//			make.height.equalTo(SYDefaultSearchViewHeight)
//		}
//
//		tableView.snp.remakeConstraints { (make) in
//			make.leading.trailing.equalToSuperview()
//			if showSearchView {
//				make.top.equalTo(searchView.snp.bottom).offset(scrollViewTopOffset)
//			}else
//			{
//				make.top.equalTo(self.view).offset(scrollViewTopOffset)
//			}
//			if leftButton.isHidden {
//				make.bottom.equalToSuperview().offset(-scrollViewBottomOffset)
//			}else {
//				make.bottom.equalTo(leftButton.snp.top).offset(-scrollViewBottomOffset)
//			}
//		}
	}
	
	func layoutNoneButtonView() {
		leftButton.isHidden = true
		rightButton.isHidden = true
	}
	func layoutSingleButtonView() {
		leftButton.isHidden = false
		rightButton.isHidden = true

		leftButton.snp.remakeConstraints { (make) in
			make.height.equalTo(50)
			make.width.equalToSuperview().offset(-(SYDefaultViewOffset * CGFloat(2)))
			make.centerX.equalToSuperview()
			if haveSafeBottom {
				make.bottom.equalTo(self.view).offset(-34)
			}else {
				make.bottom.equalTo(self.view).offset(-SYDefaultViewOffset)
			}
		}
	}
	func layoutLeftRigthtButtonView() {
		leftButton.isHidden = false
		rightButton.isHidden = false
//		rightButton.clearStyle()
//		rightButton.middleMinorButtonStyle()
		rightButton.titleLabel?.font = .cellTitleFont

		let width = (SCREEN_WIDTH - SYDefaultViewOffset * 3)/2.0
		leftButton.snp.remakeConstraints { (make) in
			make.height.equalTo(50)
			make.width.equalTo(width)
			if haveSafeBottom {
				make.bottom.equalTo(self.view).offset(-34)
			}else {
				make.bottom.equalTo(self.view).offset(-SYDefaultViewOffset)
			}
			make.left.equalToSuperview().offset(SYDefaultViewOffset)
		}
		rightButton.snp.remakeConstraints { (make) in
			make.centerY.width.height.equalTo(leftButton)
			make.right.equalToSuperview().offset(-SYDefaultViewOffset)
		}
	}
	func layoutTopBottomButtonView() {
		leftButton.isHidden = false
		rightButton.isHidden = false
//		rightButton.paleWhiteStyle()
//		rightButton.minorButtonStyle()
		rightButton.titleLabel?.font = .cellTitleFont

		leftButton.snp.remakeConstraints { (make) in
			make.height.equalTo(50)
			make.width.equalToSuperview().offset(-(SYDefaultViewOffset * CGFloat(2)))
			make.bottom.equalTo(rightButton.snp.top).offset(-SYDefaultViewOffset)
			make.centerX.equalToSuperview()
		}
		rightButton.snp.remakeConstraints { (make) in
			make.height.equalTo(50)
			make.width.equalToSuperview().offset(-(SYDefaultViewOffset * CGFloat(2)))
			make.centerX.equalToSuperview()
			if haveSafeBottom {
				make.bottom.equalTo(self.view).offset(-34)
			}else {
				make.bottom.equalTo(self.view).offset(-SYDefaultViewOffset)
			}
		}
	}
	

}

extension BaseTableViewController : BaseTableViewMustMethod {
	func configCell(_ index:IndexPath,_ model:Any,_ cell:UITableViewCell) {
		
	}
	
	func loadNewData(handle: @escaping requestDataHandle) {
		
	}
	
	func loadMoreData(handle: @escaping requestDataHandle) {
		
	}
	
	func cellClickEvent(_ index: IndexPath, _ model: Any) {
		
	}
	
	
	
}
