//
//  SYADDemoViewController.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/31.
//

import UIKit

class ADModel: SYADScrollowModelProtocol {
	var imageURL: String?
	
	var imageName: String?
	
	
}

class SYADDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


		
		let ad = SYADScrollowView.init()
		ad.config(cellType: "SYADCell", models: dataSource(), itemWidth: SCREEN_WIDTH - 160, itemHeigth: 80, lineSpacing: 15, itemSpacing: 15)
		self.view.addSubview(ad)
		ad.ssy_snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.width.equalToSuperview()
//			make.height.equalTo(110)
		}
		ad.clickHnadle = {
			index,model in
			print(index,model)
		}
		self.view.backgroundColor = .viewBGColor
		
		
		let _ = UIView.init().then { (v) in
			v.backgroundColor = .red
			self.view.addSubview(v)
			v.ssy_snp.makeConstraints { (make) in
				make.width.equalToSuperview()
				make.height.equalTo(40)
				make.left.equalToSuperview()
				make.bottom.equalTo(ad.ssy_snp.top)
			}
		}
		let _ = UIView.init().then { (v) in
			v.backgroundColor = .red
			self.view.addSubview(v)
			v.ssy_snp.makeConstraints { (make) in
				make.width.equalToSuperview()
				make.height.equalTo(40)
				make.left.equalToSuperview()
				make.top.equalTo(ad.ssy_snp.bottom)
			}
		}
    }
	func dataSource() -> [SYADScrollowModelProtocol] {
		var models :[SYADScrollowModelProtocol] = []
		let _:ADModel = {
			$0.imageURL = "https://img2.baidu.com/it/u=477210845,3563519962&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
			models.append($0)
			return $0
		}(ADModel.init())
		
		let _:ADModel = {
			$0.imageURL = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.51miz.com%2FElement%2F00%2F98%2F19%2F69%2F7d1d58e2_E981969_e065cfba.jpg%21%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue%2Fformat%2Fjpg&refer=http%3A%2F%2Fimg.51miz.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656553883&t=a05dc6b4229b6e0e2af82f857ed6919f"
			models.append($0)
			return $0
		}(ADModel.init())
		
		let _:ADModel = {
			$0.imageURL = "https://img1.baidu.com/it/u=1709475465,2948117283&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500"
			models.append($0)
			return $0
		}(ADModel.init())
		
		
		let _:ADModel = {
			$0.imageURL = "https://img2.baidu.com/it/u=477210845,3563519962&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
			models.append($0)
			return $0
		}(ADModel.init())
		
		return models
	}

}
