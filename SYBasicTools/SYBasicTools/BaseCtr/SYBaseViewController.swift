//
//  SYBaseViewController.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/12.
//

import UIKit
//segmentView
enum ShowButtonType {
	case None
	case SingleButtonView(title:String)
	case LeftRigthtButtonView(leftTitle:String,rightTitle:String)
	case TopBottomButtonView(topTitle:String,bottomTitle:String)
}

class SYBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

		//设置导航栏样式
		setNavigationStyle()
		//设置统一的样式
		setViewStyle()
    }
	func setNavigationStyle()  {
		self.navigationController?.delegate = self
		self.navigationController?.navigationBar.setBackgroundImage(UIColor.white.ssy.toImage(), for: .default)
		self.navigationController?.navigationBar.shadowImage = UIColor.white.ssy.toImage()
		var textAttributes: [NSAttributedString.Key: AnyObject] = [:]
		textAttributes[.font] = UIFont.boldSystemFont(ofSize: 20)
		textAttributes[.foregroundColor] = UIColor.cellTitleColor
		self.navigationController?.navigationBar.titleTextAttributes = textAttributes
	}
	func setViewStyle()  {
		//1 设置背景色
		self.view.backgroundColor = .viewBGColor
	}
    
}

extension SYBaseViewController {
	func readLocalFileWithName(name:String) -> NSData? {
		let path = Bundle.main.path(forResource: name, ofType: "json")
		let data = NSData.init(contentsOfFile: path!)
		return data
	}
}

extension SYBaseViewController :UINavigationControllerDelegate {
	func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
	
		if viewController is ViewController
		{
			navigationController.setNavigationBarHidden(true, animated: animated)
			viewController.navigationController?.interactivePopGestureRecognizer?.delegate = viewController as? UIGestureRecognizerDelegate;

		}else {
			if navigationController.isNavigationBarHidden {
				navigationController.setNavigationBarHidden(false, animated: animated)
			}
		}
	
	}

	
}
