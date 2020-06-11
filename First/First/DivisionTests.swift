//
//  DivisionTests.swift
//  FirstTests
//
//  Created by Bryan Cuevas on 6/9/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import XCTest

func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
    let quotient = number / dividedBy
    let remainder = number % dividedBy
    return (quotient, remainder)
}
func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int) {
    XCTAssertEqual(result.quotient, expectedQuotient)
    XCTAssertEqual(result.remainder, expectedRemainder)
}

//func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
//    XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
//    XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
//}

class DivisionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDivisors() {
        // given
        let dividend = 10
        let divisor = 3
        
        // when
        let result = divisionRemainder(of: dividend, dividedBy: divisor)
        
        // then
        verifyDivision(result, expectedQuotient: 3, expectedRemainder: 2)
    }
    
}
