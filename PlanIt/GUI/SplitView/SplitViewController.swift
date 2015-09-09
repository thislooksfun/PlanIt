//
//  SplitViewController.swift
//  PlanIt
//
//  Created by thislooksfun on 8/31/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController
{
	//MARK: - Functions -
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		let list = self.splitViewItems[0].viewController as! ListViewController
		let sub = self.splitViewItems[1].viewController as! SubListController
		let detail = self.splitViewItems[2].viewController as! DetailViewController
		
		list.subView = sub
		
		sub.listView = list
		sub.detailView = detail
		
		detail.subView = sub
    }
	
	override func viewWillAppear() {
		let list = self.splitViewItems[0].viewController as! ListViewController
		self.view.window?.initialFirstResponder = list.table
	}
	
	override func viewDidAppear()
	{
		super.viewDidAppear()
		
		let list = self.splitViewItems[0].viewController as! ListViewController
		list.table.selectRowIndexes(NSIndexSet(index: 0), byExtendingSelection: false)
	}
}