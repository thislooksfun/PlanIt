//
//  Helper.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa


//MARK: Random generators
func rand(min: Int, max: Int) -> Int {
	return Int(arc4random_uniform(UInt32(max - min)) + UInt32(min))
}

func randColor() -> NSColor {
	return buildColor(red: rand(0, max: 255), green: rand(0, max: 255), blue: rand(0, max: 255))
}

//MARK: - Int-based color building
func buildColor(red r: Int, green g: Int, blue b: Int) -> NSColor {
	return buildColor(red: r, green: g, blue: b, alpha: 1)
}
func buildColor(red r: Int, green g: Int, blue b: Int, alpha a: CGFloat) -> NSColor {
	return NSColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: a)
}

//MARK: - Color checking/manipulation
func isDarkColor(color: NSColor) -> Bool {
	return toGrayscale(color).whiteComponent < 0.5
}

func toGrayscale(color: NSColor) -> NSColor {
	return color.colorUsingColorSpaceName(NSCalibratedWhiteColorSpace)!
}

//MARK: - Custom operators
infix operator >? {}
func >?(left: CGFloat, right: CGFloat) -> CGFloat {
	return left >= right ? left : right
}

infix operator =?= { precedence 200 }
func =?=<T: Equatable>(left: T?, right: T) -> Bool {
	return left != nil && left! == right
}