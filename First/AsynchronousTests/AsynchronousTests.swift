//
//  AsynchronousTests.swift
//  AsynchronousTests
//
//  Created by Bryan Cuevas on 5/1/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import XCTest
@testable import First

class AsynchronousTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

    
//    func testPrimesUpTo100ShouldBe0() {
//
//        //given
//        let maxCount = 100
//
//        //when
//        let progress = PrimeCalculator.calculate(upTo: maxCount) { (primeNumbers) in
//            XCTAssertEqual(primeNumbers.count, 25)
//
//        }
//
//        //then
//        let predicate = NSPredicate(format: "%@.completedUnitCount == %@", argumentArray: [progress, maxCount])
//
//        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
//        wait(for: [expectation], timeout: 10)
//    }
    
//    func testPrimesUpTo100ShouldBe25() {
//        //given
//        let maxCount = 100
//        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
//        var primeCounter = 0
//
//        let expectation = XCTestExpectation(description: "Calculate primes up to \(maxCount)")
//        expectation.expectedFulfillmentCount = 25
//
//        //when
//        PrimeCalculator.calculateStreaming(upTo: maxCount) { (number) in
//            XCTAssertEqual(primes[primeCounter], number)
//            expectation.fulfill()
//            primeCounter += 1
//        }
//
//        //then
//        wait(for: [expectation], timeout: 3)
//    }
    
    func testPrimePerformance() { //Performance Testing
        measure {
            _ = PrimeCalculator.calculate(upTo: 1_000_000)
        }
    }
    
    
    

}
