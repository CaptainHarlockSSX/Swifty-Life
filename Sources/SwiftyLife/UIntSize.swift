//
//  UIntSize.swift
//
//
//  Created by Nathan Rassié on 05/06/2024.
//

import Foundation

/// Definition of a 2D size using Unsigned Integer precision, as the simulation runs in a discrete space.
public struct UIntSize {
	public var width: UInt
	public var height: UInt
	
	public init(width: UInt, height: UInt) {
		self.width = width
		self.height = height
	}
}
