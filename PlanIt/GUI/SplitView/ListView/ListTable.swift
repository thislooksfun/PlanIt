//
//  ListTable.swift
//  PlanIt
//
//  Created by thislooksfun on 9/9/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class ListTable: TableNoDeselect
{
	//MARK: - Variables -
	
	var list: ListViewController?
	
	
	//MARK: - Functions -
	
	override func becomeFirstResponder() -> Bool {
		list?.subView.table.deselectAll(nil)
		list?.subView.detailView.clear()
		
		return super.becomeFirstResponder()
	}
}