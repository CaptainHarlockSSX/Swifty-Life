//
//  Cell.swift
//
//
//  Created by Nathan Rassié on 05/06/2024.
//

import Foundation


/// Model of a cell in Conway's simulation.
struct Cell: Identifiable {
	let id: UUID
	var isAlive: Bool
	
	/// Position (x,y) of the cell in the grid.
	let position: IntPoint
	
	init(id: UUID = UUID(), isAlive: Bool, position: IntPoint) {
		self.id = id
		self.isAlive = isAlive
		self.position = position
	}
	
	/// Check if a cell is in the direct neighboorhood of a chosen cell.
	/// - Parameter cell: A cell to compare distance with.
	/// - Returns: **True** if `cell` is in the direct neighboorhood of `self.position`, **False** either.
	public func isNeighbor(to cell: Cell) -> Bool {
		let xDelta = abs(self.position.x - cell.position.x)
		let yDelta = abs(self.position.y - cell.position.y)
		
		switch (xDelta, yDelta) {
		case (1,1), (0,1), (1,0):
			return true
			
		default:
			return false
		}
	}
}
