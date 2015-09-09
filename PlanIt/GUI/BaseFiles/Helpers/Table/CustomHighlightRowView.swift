//
//  CustomHighlightRowView.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class CustomHighlightRowView: NSTableRowView
{
	//MARK: - Variables -
	
	private static var rows = [String: [Int: CustomHighlightRowView]]()
	
	private let light = buildColor(white: 255, alpha: 0.75)
	private let dark = buildColor(white: 255, alpha: 0.25)
	
	lazy var cell: CustomTableCell = {
		return self.viewAtColumn(0) as! CustomTableCell
	}()
	
	var row: Int?
	var doRedraw = false
	
	
	//MARK: - Functions -
	
	func redraw() {
		doRedraw = true
		self.needsDisplay = true
	}
	
	override func drawRect(dirtyRect: NSRect) {
		super.drawRect(dirtyRect)
		
		if selected {
			if doRedraw {
				cell.prepForRedraw()
			}
			cell.select()
			
			if emphasized {
				cell.foreground()
				
				self.cell._color!.set()
			} else if cell._color != nil {
				cell.background()
				
				(isDarkColor(cell.color) ? light : dark).set()
			}
			
			NSRectFill(dirtyRect)
		} else {
			cell.deselect()
		}
		
		doRedraw = false
	}
	
	static func getForTableView(table: String, andRow row: Int) -> CustomHighlightRowView? {
		guard row >= 0 else { return nil }
		
		var tab = rows[table]
		if tab == nil {
			tab = [Int: CustomHighlightRowView]()
			rows[table] = tab
		}
		
		var view = tab![row]
		if view == nil {
			view = CustomHighlightRowView()
			view!.row = row
			rows[table]![row] = view
		}
		
		return view!
	}
}