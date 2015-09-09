//
//  TableNoDeselect.swift
//  PlanIt
//
//  Created by thislooksfun on 8/31/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class TableNoDeselect: NSTableView
{
	//MARK: - Variables -
	
	var allowedFirstResponder = false
	
	
	//MARK: - Functions -
	
	override func mouseDown(theEvent: NSEvent)
	{
		let localLocation = convertPoint(theEvent.locationInWindow, fromView: nil)
		let clickedRow = rowAtPoint(localLocation)
		
		if (clickedRow > -1) {
			super.mouseDown(theEvent)
		} else {
			self.window?.makeFirstResponder(self);
		}
	}
}