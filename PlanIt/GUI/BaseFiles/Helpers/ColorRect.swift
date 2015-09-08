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
	@IBInspectable var color: NSColor = NSColor.whiteColor()
	
	override func drawRect(dirtyRect: NSRect) {
		color.set()
		NSRectFill(dirtyRect)
	}
}