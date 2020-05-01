//
//  UserTests.swift
//  FirstTests
//
//  Created by Bryan Cuevas on 5/1/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation
import XCTest

struct User {
    static let upgradedNotification = Notification.Name("UserUpgraded")
    
    func upgrade(using center: NotificationCenter = NotificationCenter.default) {
        
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            center.post(name: User.upgradedNotification, object: nil, userInfo: ["level": "gold"]) }
    }
    
}

class UserTests: XCTestCase {
    func testUserUpgradedPostsNotifications() {
        //given
        let center = NotificationCenter()
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification, object: nil, notificationCenter: center)
        
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else {
                return false
            }
            
            if level == "gold" {
                return true
            } else {
                return false
            }
        }
        
        //when
        user.upgrade(using: center)
        
        //then
        wait(for:[expectation], timeout: 3)
        
    }
}
