//
//  IntStruct.swift
//  
//
//  Created by Nathan Rassié on 05/06/2024.
//

import Foundation

/// Definition of a 2D size using Integer precision, as the simulation runs in a discrete space.
public struct IntSize {
	public var width: Int
	public var height: Int
	
	public init(width: Int, height: Int) {
		self.width = width
		self.height = height
	}
}

/// Definition of a 2D point location using Integer precision, as the simulation runs in a discrete space.
public struct IntPoint {
	public var x: Int
	public var y: Int
	
	public init(x: Int, y: Int) {
		self.x = x
		self.y = y
	}
}
