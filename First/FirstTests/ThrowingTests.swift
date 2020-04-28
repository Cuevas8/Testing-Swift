//
//  ThrowingTests.swift
//  FirstTests
//
//  Created by Bryan Cuevas on 4/28/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import XCTest

enum GameError: LocalizedError {
    case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}

struct Game {
    let name: String
    
    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is OK to play!")
        }
    }
}

class ThrowingTests: XCTestCase {
    
    func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        
        do {
            try game.play()
            XCTFail("BioBlitz has not been purchased")
        } catch GameError.notPurchased {
            //Success
        } catch {
            XCTFail()
        }
    }
    
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
            
        }
    }
    
    func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeys")
        XCTAssertNoThrow(try game.play())
    }
    
    func testDeadStormRisingThrows() throws {
        let game = Game(name: "Dead Storm Rising")
        XCTAssertThrowsError(try game.play())
    }
    
    func testCrashyPlaneDoesntThrow() throws {
        let game = Game(name: "CrashyPlane")
        try game.play()
    }

}

extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}
