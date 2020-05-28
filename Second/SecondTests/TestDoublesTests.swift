//
//  TestDoublesTests.swift
//  SecondTests
//
//  Created by Bryan Cuevas on 5/28/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import XCTest
@testable import Second

class TestDoublesTests: XCTestCase {
    
    
    func testUserCantBuyUnreleasedApp() {
        
        struct UnreleasedAppStub: AppProtocol {
            var price: Decimal = 0
            var minimumAge = 0
            var isReleased = false
            
            func canBePurchased(by user: UserProtocol) -> Bool {
                return false
            }
        }
        
        // given
        var sut = User(funds: 100, age: 21, apps: [])
        let app = UnreleasedAppStub()
        // when
        let wasBought = sut.buy(app)
        // then
        XCTAssertFalse(wasBought)
    }
        
        
    

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

}
