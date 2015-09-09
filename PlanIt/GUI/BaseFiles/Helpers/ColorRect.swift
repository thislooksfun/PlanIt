//
//  ColorRect.swift
//  PlanIt
//
//  Created by thislooksfun on 9/3/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class ColorRect: NSView
{
	//MARK: - Variables -
	
	@IBInspectable var color: NSColor = NSColor.whiteColor()
	
	
	//MARK: - Functions -
	
	override func drawRect(dirtyRect: NSRect) {
		color.set()
		NSRectFill(dirtyRect)
	}
}