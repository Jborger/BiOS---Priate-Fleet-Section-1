//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
    
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false) //Instantiate medium ship object
        human.addShipToGrid(mediumShip1) //place ship on board
        
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 2, y: 1), isVertical: false) //Instantiate medium ship object
        human.addShipToGrid(mediumShip2) //place ship on board
        
        let smallShip1 = Ship(length: 2, location: GridLocation(x: 0, y: 2), isVertical: false)//Instantiate small ship object
        human.addShipToGrid(smallShip1) //place ship on board
        
        let largeShip1 = Ship(length: 4, location: GridLocation(x: 0, y: 5), isVertical: false) //Instantiate Large Ship
        human.addShipToGrid(largeShip1)
        
        let xLargeShip1 = Ship(length: 5, location: GridLocation(x: 0, y: 4), isVertical: false)  //Instantiate X Large Ship
        human.addShipToGrid(xLargeShip1)
        
        let mine1 = Mine(location: GridLocation(x: 5, y: 2), explosionText: "Boom!")  //Instantiate mine
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x: 6, y: 3), explosionText: "Boom!") //Instantiate mine

        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        let numberofShips = 5 //declare constant for ships, pass into final score calcuation
        
        
        //Forumla dervied from - https://discussions.udacity.com/t/pirate-fleet-whats-the-damage-captain-final-score/36764
        finalScore = ((numberofShips - gameStats.enemyShipsRemaining) * gameStats.sinkBonus) + ((numberofShips - gameStats.humanShipsSunk) * gameStats.shipBonus) - ((gameStats.numberOfMissesByHuman + gameStats.numberOfHitsOnEnemy) * gameStats.guessPenalty)

        print("the value of final score is \(finalScore)")

        
        return finalScore
    }
}