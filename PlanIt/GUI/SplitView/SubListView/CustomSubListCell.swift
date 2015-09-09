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
	//MARK: - Variables -
	
	@IBOutlet var progress: ProgressBar!
	
	
	//MARK: - Functions -
	
	override var color: NSColor {
		get { return super.color }
		set {
			super.color = newValue
			progress.color = newValue
		}
	}
	
	override func prepForRedraw() {
		super.prepForRedraw()
		progress.hidden = false
	}
	
	override func select() -> Bool {
		guard super.select() else { return false }
		
		progress.hidden = true
		
		return true
	}
	
	override func deselect() -> Bool {
		guard super.deselect() else { return false }
		
		progress.hidden = false
		progress.needsDisplay = true
		
		return true
	}
}