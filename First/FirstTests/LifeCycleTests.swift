//
//  LifeCycleTests.swift
//  FirstTests
//
//  Created by Bryan Cuevas on 4/27/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import XCTest

class LifeCycleTests: XCTestCase {
    
    override class func setUp() {
        print("In class setUp.")
    }
    
    override class func tearDown() {
        print("In class tearDown.")
    }

    override func setUp() {
        print("In setUp.")
    }

    override func tearDown() {
        print("In tearDown.")
    }

    func testExample() {
        print("Starting test")
        
        addTeardownBlock {
            print("In first tearDown block.")
        }
        
        print("In middle of test.")
        
        addTeardownBlock {
            print("In second tearDown block.")
        }
        
        print("Finishing test.")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
