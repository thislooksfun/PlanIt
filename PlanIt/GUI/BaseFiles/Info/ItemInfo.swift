//
//  ItemInfo.swift
//  PlanIt
//
//  Created by thislooksfun on 8/31/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class ItemInfo
{
	//MARK: - Variables -
	
	var name: String
	var dueBy: NSDate?
	
	
	//MARK: - Initalization -
	
	convenience init(name: String) {
		self.init(name: name, dueBy: nil)
	}
	init(name: String, dueBy: NSDate?) {
		self.name = name
		self.dueBy = dueBy
	}
}