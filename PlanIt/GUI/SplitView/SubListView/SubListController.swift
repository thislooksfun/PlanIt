//
//  SubListListController.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class SubListController: NSViewController, NSTableViewDataSource, NSTableViewDelegate
{
	@IBOutlet var table: NSTableView!
	@IBOutlet var color: DFColorWell!
	
	private var infoID = -1
	private var objects = [ItemInfo]()
	
	private var _listColor = NSColor.blackColor()
	private var listColor: NSColor {
		get { return _listColor }
		set {
			_listColor = newValue
			reloadColor()
		}
	}
	
	var listView: ListViewController!
	var detailView: DetailViewController!
	
	var heightCheckCell: CustomSubListCell!
	
	var ready = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		color.addObserver(self, forKeyPath: "color", options: NSKeyValueObservingOptions.New, context: nil)
	}
	
	override func viewWillAppear() {
		super.viewWillAppear()
		ready = true
	}
	
	override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
		if keyPath == "color" && (object as? DFColorWell) == color {
			if let color = (change?["new"] as? NSColor) {
				listColor = color
			}
		} else {
			super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
		}
	}
	
	func reloadColor() {
		guard ready else { return }
		
		let selected = table.selectedRow
		table.reloadData()
		if selected > -1 && selected < objects.count {
			table.selectRowIndexes(NSIndexSet(index: selected), byExtendingSelection: false)
			self.detailView.setDetails(objects[selected], color: _listColor)
		}
		
		self.listView.updateColor(_listColor, forID: infoID)
	}
	
	override func viewDidAppear() {
		super.viewDidAppear()
	}
	
	func setDetails(info: ListInfo) {
		//TODO: add title?
		self.infoID = info.ID
		self.objects = info.items
		self.listColor = info.color
		self.color.color = info.color
		
		table.reloadData()
	}

	func addItem(name: String) {
		objects.append(ItemInfo(name: name))
		table.reloadData()
	}
	
	func removeRow(label s: String) {
		for (index, info) in objects.enumerate() {
			if info.name == s {
				removeRow(index: index)
			}
		}
	}

	func removeRow(index i: Int) {
		objects.removeAtIndex(i);
	}
	
	func numberOfRowsInTableView(tableView: NSTableView) -> Int {
		return objects.count
	}
	
	func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
		return buildCellForRow(row)
	}
	
	func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
		let cell = buildCellForRow(row)
		
		return cell.contentContainer.fittingSize.height >? 20
	}
	
	func buildCellForRow(row: Int) -> CustomSubListCell {
		let cell = table.makeViewWithIdentifier("subListCell", owner: self) as! CustomSubListCell
		
		let info = self.objects[row]
		cell.reset()
		cell.label.stringValue = info.name
		cell.color = listColor
		
		return cell
	}
	
	func tableViewSelectionDidChange(notification: NSNotification) {
		guard self.table.numberOfSelectedRows > 0 else {
			self.detailView.clear()
			return
		}
		
//		let cell = table.viewAtColumn(0, row: table.selectedRow, makeIfNecessary: false) as! CustomDetailCell
		self.detailView.setDetails(objects[table.selectedRow], color: self.listColor)
	}
	
	func tableView(tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
		return CustomHighlightRowView()
	}
	
	override func keyDown(theEvent: NSEvent) {
		if theEvent.keyCode == 123 {
			self.table.deselectAll(nil)
			self.view.window?.makeFirstResponder(self.listView.table)
		} else {
			super.keyDown(theEvent)
		}
	}
}