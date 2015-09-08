//
//  ListInfo.swift
//  PlanIt
//
//  Created by thislooksfun on 8/31/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class ListInfo
{
	private static var lastID = 0
	private static var nextID: Int { get { return lastID++ } }
	
	var ID: Int
	var title: String
	var color: NSColor
	var items: [ItemInfo]
	var unfinishedItems: Int = 42
	
	convenience init(title: String, color: NSColor) {
		self.init(title: title, color: color, items: [])
	}
	
	init(title: String, color: NSColor, items: [ItemInfo]) {
		self.ID = ListInfo.nextID
		self.title = title
		self.color = color
		self.items = items
	}
}