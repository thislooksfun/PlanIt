//
//  NewListDialogueController.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class NewListDialogueController: NSViewController, NSTextFieldDelegate
{
	@IBOutlet var name: NSTextField!
	@IBOutlet var color: DFColorWell!
	@IBOutlet var createButton: NSButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		color.color = randColor()
    }
	
	@IBAction func create(sender: AnyObject?) {
		guard !name.stringValue.isEmpty else { return }
		
		let lists = self.representedObject as! ListViewController
		lists.createList(name.stringValue, color: color.color)
		self.dismissController(self)
	}
	@IBAction func cancel(sender: AnyObject?) {
		self.dismissController(self)
	}
	
	override func keyUp(theEvent: NSEvent) {
		createButton.enabled = !name.stringValue.isEmpty
	}
	
	func control(control: NSControl, textView: NSTextView, doCommandBySelector commandSelector: Selector) -> Bool {
		if commandSelector == "insertNewline:" {
			create(nil)
			return true
		}
		return false
	}
}