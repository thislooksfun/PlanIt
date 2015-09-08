//
//  ListViewController.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class ListViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate
{
	//MARK: - Variables -
	
	@IBOutlet var table: NSTableView!
	
	var objects = [ListInfo]()
	var rowViews = [CustomHighlightRowView]()
	
	var subView: SubListController!
	
	var hasInitalized = false
	
	var updateSub = true
	
	//MARK: - Functions -
	
	//MARK: Initialization
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		initItems()
    }
	
	private func initItems() {
		objects = [
			ListInfo(title: "Homework",   color: randColor(), items: [ItemInfo(name: "Phys"), ItemInfo(name: "Comp"), ItemInfo(name: "History")]),
			ListInfo(title: "Schoolwork", color: randColor(), items: [ItemInfo(name: "Math"), ItemInfo(name: "French")]),
			ListInfo(title: "Misc",       color: randColor(), items: [ItemInfo(name: "Brush teeth")])
		]
		
		table.reloadData()
	}
	
	func updateColor(color: NSColor, forID ID: Int) {
		if let (item, _) = getItem(ID) {
			item.color = color
			reloadData(false)
		}
	}
	
	func reloadData(updateSubList: Bool) {
		let selection = table.selectedRow
		table.reloadData()
		if selection > -1 {
			updateSub = updateSubList
			table.selectRowIndexes(NSIndexSet(index: selection), byExtendingSelection: false)
			CustomHighlightRowView.getForTableView("list", andRow: selection)?.redraw()
			updateSub = true
		}
	}
	
	//MARK: - Table helpers
	
	func createList(label: String, color: NSColor) {
		objects.append(ListInfo(title: label, color: color))
		reloadData(false)
	}
	
	func getItem(ID: Int) -> (info: ListInfo, index: Int)? {
		for (index, info) in objects.enumerate() {
			if info.ID == ID {
				return (info, index)
			}
		}
		
		return nil
	}
	
	func removeRow(label s: String) {
		for (index, info) in objects.enumerate() {
			if info.title == s {
				removeRow(index: index)
			}
		}
	}
	
	func removeRow(index i: Int) {
		objects.removeAtIndex(i);
	}
	
	
	//MARK: - Table overrides
	
	func numberOfRowsInTableView(tableView: NSTableView) -> Int {
		return objects.count
	}
	
	func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
		let cell = table.makeViewWithIdentifier("listCell", owner: self) as! CustomListCell
		
		let info = self.objects[row]
		cell.label.stringValue = info.title
		cell.color = info.color
		cell.count = info.unfinishedItems
		
		return cell
	}
	
	func tableViewSelectionDidChange(notification: NSNotification) {
		guard table.numberOfSelectedRows > 0 else { return }
		guard updateSub else { return }
		
		subView.setDetails(objects[table.selectedRow])
	}
	
	func tableView(tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
		return CustomHighlightRowView.getForTableView("list", andRow: row)
	}
	
	override func keyDown(theEvent: NSEvent) {
		hasInitalized = true
		switch theEvent.keyCode {
		case 124:
			self.view.window?.makeFirstResponder(self.subView.table)
			if self.subView.table.numberOfSelectedRows <= 0 {
				self.subView.table.selectRowIndexes(NSIndexSet(index: 0), byExtendingSelection: false)
			}
		default:
			super.keyDown(theEvent)
		}
	}
	
	
	//MARK: - Segues
	
	override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "createNewList" {
			let dest = segue.destinationController as! NewListDialogueController
			dest.representedObject = self
		}
	}
}