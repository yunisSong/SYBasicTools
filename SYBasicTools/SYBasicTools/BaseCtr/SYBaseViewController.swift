//
//  SYBaseViewController.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import UIKit

class SYBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		//1 设置背景色
		//2 设置导航栏样式
		//3 设置
		
    }
    
}

extension SYBaseViewController {
	func readLocalFileWithName(name:String) -> NSData? {
		let path = Bundle.main.path(forResource: name, ofType: "json")
		let data = NSData.init(contentsOfFile: path!)
		return data
	}
}

