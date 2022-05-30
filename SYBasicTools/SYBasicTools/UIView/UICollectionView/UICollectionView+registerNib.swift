//
//  UICollectionView+registerNib.swift
//  SYBasicTools
//
//  Created by Yunis on 2022/5/30.
//

import UIKit

extension SSYHelp where Base :UICollectionView
{
	func ssy_register(_ nib:String)  {
		guard !nib.isEmpty else {
			return;
		}
		self.base.register(nib.ssy.ssy_nib(), forCellWithReuseIdentifier: nib)
	}
	func ssy_registerClass(_ cellClass:String)  {
		guard !cellClass.isEmpty else {
			return;
		}
		self.base.register(NSClassFromString(cellClass), forCellWithReuseIdentifier: cellClass)
	}
	
	func ssy_registerSectionHeader(nib:String)  {
		guard !nib.isEmpty else {
			return;
		}
		self.base.register(nib.ssy.ssy_nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: nib)
	}
	func ssy_registerSectionHeader(cellClass:String)  {
		guard !cellClass.isEmpty else {
			return;
		}
		self.base.register(NSClassFromString(cellClass), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellClass)
	}
	func ssy_registerSectionFooter(nib:String)  {
		guard !nib.isEmpty else {
			return;
		}
		self.base.register(nib.ssy.ssy_nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: nib)
	}
	func ssy_registerSectionFooter(cellClass:String)  {
		guard !cellClass.isEmpty else {
			return;
		}
		self.base.register(NSClassFromString(cellClass), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: cellClass)
	}
	
}
