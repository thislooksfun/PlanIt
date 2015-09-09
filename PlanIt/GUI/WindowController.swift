//
//  WindowController.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController
{
	//MARK: - Functions -
	
    override func windowDidLoad() {
        super.windowDidLoad()
		
		self.window!.titleVisibility = NSWindowTitleVisibility.Hidden;
		self.window!.titlebarAppearsTransparent = true;
		self.window!.styleMask |= NSFullSizeContentViewWindowMask;
    }
}