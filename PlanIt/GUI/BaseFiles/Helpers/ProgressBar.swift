//
//  ProgressBar.swift
//  PlanIt
//
//  Created by thislooksfun on 8/31/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class ProgressBar: NSBox
{
	private let gray = buildColor(white: 127, alpha: 0.5)
	var color: NSColor = NSColor.blueColor()
	var percent: CGFloat = 0.75
	
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
		
		let widthPercent = dirtyRect.width * percent
		let rect = NSRect(x: 0, y: 0, width: widthPercent, height: dirtyRect.height)
		let rectRemain = NSRect(x: widthPercent, y: 0, width: dirtyRect.width - (widthPercent), height: dirtyRect.height)
		
		color.set()
		NSRectFill(rect)
		gray.set()
		NSRectFill(rectRemain)
    }
}