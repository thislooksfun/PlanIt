//
//  CustomListCell.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class CustomListCell: CustomTableCell
{
	@IBOutlet private var countLabel: NSButton!
	
	var _count = -1
	
	var count: Int {
		get { return Int(countLabel.title)! }
		set {
			countLabel.title = String(newValue)
			countLabel.hidden = (newValue == 0)
		}
	}
	
	override func reset() {
		super.reset()
		_count = -1
	}
	
	override func select() -> Bool {
		if super.select() {
			_count = count
			count = 0
			return true
		}
		return false
	}
	
	override func deselect() -> Bool {
		if super.deselect() {
			count = _count
			return true
		}
		return false
	}
}