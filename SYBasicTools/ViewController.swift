//
//  ViewController.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/3/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		let tableview = UITableView.init().with {
			$0.ssy.addHelp { (help) in
				help.cellID = "SYDemo1TableViewCell"
			}
		}
		tableview.help.dataSource = dataSource()
		self.view.addSubview(tableview)
		tableview.ssy_snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		self.view.backgroundColor = .red
		syprint("加载完成")
    }

	func dataSource() -> [BaseCellLayoutModel] {
		var models:[BaseCellLayoutModel] = []
		_ = BaseCellLayoutModel.init().with{
			$0.cellID = "SYDemo1TableViewCell"
			$0.leftString_1 = "111"
			$0.leftColor = .cellTitleColor
			models.append($0)
		}
		_ = BaseCellLayoutModel.init().with{
			$0.cellID = "SYDemo1TableViewCell"
			$0.leftString_1 = "222"
			$0.leftColor = .cellTitleColor
			models.append($0)
		}
		_ = BaseCellLayoutModel.init().with{
			$0.cellID = "SYDemo1TableViewCell"
			$0.leftString_1 = "333"
			$0.leftColor = .cellTitleColor
			models.append($0)
		}
		_ = BaseCellLayoutModel.init().with{
			$0.cellID = "SYDemo1TableViewCell"
			$0.leftString_1 = "444"
			$0.leftColor = .cellTitleColor
			models.append($0)
		}
		return models
		
	}

}

