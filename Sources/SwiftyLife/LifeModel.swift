//
//  LifeModel.swift
//
//
//  Created by Nathan Rassié on 05/06/2024.
//

import Foundation
import Combine

/// Conway's Game of Life logic implemented in Swift.
public final class LifeModel: ObservableObject {
	/// Size (width x height, in pixels) of the simulation universe.
	public private(set) var size: IntSize
	
	/// A timer subscriber which notifies
	private var timerSubscription: Cancellable?
	
	/// Percentage of living cells to create for starting conditions.
	private var livingCellsAmount: Int
	
	/// The simulation universe, represented in two dimensions by a grid of pixels.
	public private(set) var grid = [Cell]()
	
	/// Timer publishing each time the simulation iterates. Listen to this variable to update your UI.
	@Published public var timer = Timer.publish(every: 1, tolerance: 0.2, on: .main, in: .common)
	
	/// LifeModel initializer.
	///
	/// Filling the size parameter let you choose the total number of cells in the simulation, as **one cell is one pixel**.
	/// You can later multiply each cell's position by a positive factor to increase the size of the board and the cells in your UI,
	/// according to your screen size.
	///
	/// - Parameters:
	///   - size: Size (width x height, in pixels) of the simulation universe.
	///   - livingCellsAmount: Percentage of living cells to create for starting conditions. You should input a value between 0 and 100.
	public init(size: IntSize, livingCellsAmount: Int) {
		self.size = size
		self.livingCellsAmount = livingCellsAmount
		generateRandomGrid(size)
	}
	
	/// LifeModel convenience initializer.
	/// - Parameters:
	///   - width: Width (in pixels) of the simulation universe.
	///   - height: Height (in pixels) of the simulation universe.
	///   - livingCellsAmount: Percentage of living cells to create for starting conditions. You should input a value between 0 and 100.
	public convenience init(width: Int, height: Int, livingCellsAmount: Int) {
		self.init(size: IntSize(width: width, height: height), livingCellsAmount: livingCellsAmount)
	}
	
	/// Starting conditions of the simulation. It generates a new grid with a random amount of living cells based on ``livingCellsAmount`` parameter.
	/// - Parameter size: Size (width x height, in pixels) of the simulation universe.
	private func generateRandomGrid(_ size: IntSize) {
		for x in 0 ..< size.width {
			for y in 0 ..< size.height {
				let cell: Cell
				
				guard livingCellsAmount > 0 else {
					cell = Cell(isAlive: false, position: IntPoint(x: x, y: y))
					grid.append(cell)
					continue
				}
				
				// Returns a random value between 0 and 100 excluded
				let randomState = Int(arc4random_uniform(100))
				
				switch randomState {
				case 0..<livingCellsAmount:
					cell = Cell(isAlive: true, position: IntPoint(x: x, y: y))
				default:
					cell = Cell(isAlive: false, position: IntPoint(x: x, y: y))
				}
				
				grid.append(cell)
			}
		}
	}
	
	/// Evolve the current state of the simulation to the next one, applying standard rules of Conway's simulation.
	/// - Returns: None
	public func nextIteration() -> Void {
		var newGrid = [Cell]()
		let livingCells = grid.filter { $0.isAlive }
		
		for cell in grid {
			let livingNeighbors = livingCells.filter { $0.isNeighbor(to: cell) }
			
			switch livingNeighbors.count {
			case 2...3 where cell.isAlive:
				newGrid.append(cell)
			case 3 where !cell.isAlive:
				let newCell = Cell(isAlive: true, position: cell.position)
				newGrid.append(newCell)
			default:
				let newCell = Cell(isAlive: false, position: cell.position)
				newGrid.append(newCell)
			}
		
		}
		
		grid = newGrid
	}
	
	/// Reset the simulation by generating a new random grid.
	/// - Returns: None
	public func resetSimulation() -> Void {
		grid = [Cell]()
		generateRandomGrid(size)
	}
	
	/// Stop the simulation and disconnect the timer publisher.
	/// - Returns: None
	public func stopSimulation() -> Void {
		timerSubscription?.cancel()
		timerSubscription = nil
	}
	
	/// Start the simulation and connect the timer which will publish at each new iteration.
	/// - Parameter fps: The number of iteration per seconds.
	/// - Returns: None
	public func startSimulation(at fps: Double) -> Void {
		timer = Timer.publish(every: 1 / fps, tolerance: 0.2, on: .main, in: .common)
		timerSubscription = timer.connect()
	}
}
