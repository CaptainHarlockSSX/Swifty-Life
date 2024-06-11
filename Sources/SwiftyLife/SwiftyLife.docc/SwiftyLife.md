# ``SwiftyLife``

A Swift package running Conway's "Game of Life" simulation.

@Metadata {
	@PageColor(purple)
}

## Overview

Connect this package to your favorite UI to run the logic of Conway's experiment on life evolution.
It follows the original rules :

- Any live cell with fewer than two live neighbors dies, as if by underpopulation.
  
- Any live cell with two or three live neighbors lives on to the next generation.
  
- Any live cell with more than three live neighbors dies, as if by overpopulation.
  
- Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

## Topics

### How to use

Create your own UI and instantiate a ``LifeModel`` as a `StateObject` in your app.

Thereafter you can call any methods you need such as ``LifeModel/startSimulation``, ``LifeModel/stopSimulation``, ``LifeModel/resetSimulation`` or ``LifeModel/nextIteration``.

Starting the simulation will connect a LifeModel/timer publisher to notifies each time the simulation iterates.

### Content

``LifeModel``
 
``Cell``
 
``IntStruct``




