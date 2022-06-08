//
//  SYADMiddleLayout.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/6/8.
//

import UIKit

/// 居中。滚动。
class SYADMiddleLayout: UICollectionViewFlowLayout {
	init(itemSize:CGSize = .zero) {
		super.init()
		self.itemSize = itemSize
		self.scrollDirection = .horizontal
		self.minimumLineSpacing = 0
		self.collectionView?.isPagingEnabled = true
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
		return true
	}
	
	// 获取当前屏幕展示的item 对符合条件的展开形变。
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		var arr:[UICollectionViewLayoutAttributes] = []
		//获取当前屏幕展示的items数据
		arr.append(contentsOf: super.layoutAttributesForElements(in: rect) ?? [])
		if let collectionView = self.collectionView {
			arr.forEach { (att) in
				//计算 当前 item 是否已经划过屏幕的一半。
				let distance = abs(att.center.x - (collectionView.frame.size.width * 0.5) - collectionView.contentOffset.x)
				var scale = 0.75
				let w = collectionView.frame.size.width * 0.5
				//如果已经划过了屏幕的一半
				if distance < w {
					let change = (1 - distance / w ) * 0.25
					scale = scale + Double(change)
				}
				att.transform = CGAffineTransform.init(scaleX: 1.0, y: CGFloat(scale))
			}
		}
		
		
		return arr
	}
	
	override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
		var offsetAdjustment = CGFloat.init(MAXFLOAT)
		//
		let horizontalCenter = proposedContentOffset.x + ((self.collectionView?.bounds.width ?? 0) / 2.0)
		let targetRect = CGRect.init(x: proposedContentOffset.x, y: 0.0, width: self.collectionView?.bounds.width ?? 0, height: self.collectionView?.bounds.height ?? 0)
		
		let array = super.layoutAttributesForElements(in: targetRect)
		
		array?.forEach({ (layoutAttributes) in
			let itemHorizontalCenter = layoutAttributes.center.x
			if (abs(itemHorizontalCenter - horizontalCenter) < abs(offsetAdjustment)) {
				offsetAdjustment = itemHorizontalCenter - horizontalCenter;
			}
		})
		return CGPoint.init(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
	}
}
