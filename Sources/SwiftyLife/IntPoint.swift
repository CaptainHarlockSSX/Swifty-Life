//
//  IntPoint.swift
//  
//
//  Created by Nathan Rassié on 14/06/2024.
//

import Foundation

/// Definition of a 2D point location using Integer precision, as the simulation runs in a discrete space.
public struct IntPoint {
	public var x: Int
	public var y: Int
	
	public init(x: Int, y: Int) {
		self.x = x
		self.y = y
	}
}
