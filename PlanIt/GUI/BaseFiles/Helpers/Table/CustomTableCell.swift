//
//  CustomTableCell.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class CustomTableCell: NSTableCellView
{
	@IBOutlet var label: NSTextField!
	@IBOutlet var contentContainer: NSView!
	
	
	private(set) var _color: NSColor?
	private(set) var selected = false
	private(set) var isInBackground = false
	
	private let white = buildColor(red: 250, green: 250, blue: 250)
	private let black = buildColor(red: 5, green: 5, blue: 5)
	
	var color: NSColor {
		get { return label.textColor! }
		set { label.textColor = newValue }
	}
	
	func reset() {
		selected = false
		isInBackground = false
		_color = nil
		label.stringValue = ""
		label.textColor = black
	}
	
	func prepForRedraw() {
		selected = false
		isInBackground = false
		_color = isInBackground ? _color : nil
	}
	
	func background() -> Bool {
		guard !isInBackground else { return false }
		
		isInBackground = true
		color = _color ?? color
		return true
	}
	func foreground() -> Bool {
		guard isInBackground else { return false }
		
		isInBackground = false
		_color = color
		color = isDarkColor(_color!) ? white : black
		return true
	}
	
	func select() -> Bool {
		guard !selected else { return false }
		
		selected = true
		_color = color
		color = isDarkColor(_color!) ? white : black
		return true
	}
	func deselect() -> Bool {
		guard selected else { return false }
		
		selected = false
		color = _color ?? color
		return true
	}
}