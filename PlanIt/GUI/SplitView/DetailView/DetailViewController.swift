//
//  DetailViewController.swift
//  PlanIt
//
//  Created by thislooksfun on 9/3/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController
{
	//MARK: - Variables -
	
	@IBOutlet var titleLabel: NSTextField!
	@IBOutlet var progress: ProgressBar!
	
	var subView: SubListController!
	
	
	//MARK: - Functions -
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func setDetails(info: ItemInfo?, color: NSColor) {
		guard let inf = info else {
			clear()
			return
		}
		
		self.view.hidden = false
		
		self.titleLabel.stringValue = inf.name
		self.titleLabel.textColor = color
		
		self.progress.color = color
		self.progress.needsDisplay = true
		
		//TODO: More info stuff
	}
	
	func clear() {
		self.view.hidden = true
	}
}