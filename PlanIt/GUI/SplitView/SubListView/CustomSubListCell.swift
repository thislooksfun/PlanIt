//
//  CustomSubListCell.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class CustomSubListCell: CustomTableCell
{
	@IBOutlet var progress: ProgressBar!
	
	override var color: NSColor {
		get { return label.textColor! }
		set {
			label.textColor = newValue
			progress.color = newValue
		}
	}
	
	override func select() -> Bool {
		guard super.select() else { return false }
		
		progress.hidden = true
		
		return true
	}
	
	override func deselect() -> Bool {
		guard super.deselect() else { return false }
		
		progress.hidden = false
		
		return true
	}
}