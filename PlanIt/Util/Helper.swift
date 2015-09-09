//
//  Helper.swift
//  PlanIt
//
//  Created by thislooksfun on 8/30/15.
//  Copyright © 2015 thislooksfun. All rights reserved.
//

import Cocoa


//MARK: Random generators
func rand(min min: Int, max: Int) -> Int {
	return Int(arc4random_uniform(UInt32(max - min)) + UInt32(min))
}

func randColor(min min: Int, max: Int) -> NSColor {
	return buildColor(red: rand(min: min, max: max), green: rand(min: min, max: max), blue: rand(min: min, max: max))
}
func randDarkColor() -> NSColor {
	return randColor(min: 0, max: 127)
}
func randLightColor() -> NSColor {
	return randColor(min: 127, max: 255)
}

//MARK: - Int-based color building
func buildColor(white w: Int) -> NSColor {
	return buildColor(white: w, alpha: 1)
}
func buildColor(white w: Int, alpha a: CGFloat) -> NSColor {
	return NSColor(white: CGFloat(w)/255, alpha: a)
}
func buildColor(red r: Int, green g: Int, blue b: Int) -> NSColor {
	return buildColor(red: r, green: g, blue: b, alpha: 1)
}
func buildColor(red r: Int, green g: Int, blue b: Int, alpha a: CGFloat) -> NSColor {
	return NSColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: a)
}

//MARK: - Color checking/manipulation
func isDarkColor(color: NSColor) -> Bool {
	return color.toGrayscale().whiteComponent < 0.5
}

//Mark: - Arithmetic functions
func clamp(i: Int, var between min: Int, var and max: Int) -> Int {
	if min > max {
		let tmp = max
		min = max
		max = tmp
	}
	
	if i < min {
		return min
	}
	if i > max {
		return max
	}
	
	return i
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

//MARK: - Extensions
extension NSColor {
	func toGrayscale() -> NSColor {
		return self.colorUsingColorSpaceName(NSCalibratedWhiteColorSpace)!
	}
	
	func toString() -> String {
		switch self.colorSpaceName {
		case NSCustomColorSpace, NSCalibratedRGBColorSpace, NSDeviceRGBColorSpace:
			let red = clamp(Int(round(self.redComponent * 255)), between: 0, and: 255)
			let green = clamp(Int(round(self.greenComponent * 255)), between: 0, and: 255)
			let blue = clamp(Int(round(self.blueComponent * 255)), between: 0, and: 255)
			
			return "r: \(red), g: \(green), b: \(blue), a: \(self.alphaComponent)"
		default:
			return "Unknown colorspace: "+self.colorSpaceName
		}
	}
}