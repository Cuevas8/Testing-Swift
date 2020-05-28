//
//  TestDoubles.swift
//  Second
//
//  Created by Bryan Cuevas on 5/28/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation


protocol UserProtocol {
    var funds: Decimal { get set }
    var age: Int { get set }
    var apps: [AppProtocol] { get set }
    mutating func buy(_ app: AppProtocol) -> Bool
    
}

protocol AppProtocol {
    var price: Decimal { get set }
    var minimumAge: Int { get set }
    var isReleased: Bool { get set }
    func canBePurchased(by user: UserProtocol) -> Bool
    
}


struct App: AppProtocol {
    

    
    var price: Decimal
    var minimumAge: Int
    var isReleased: Bool
    
    func canBePurchased(by user: UserProtocol) -> Bool {
        guard isReleased else {
        return false
        }
        guard user.funds >= price else { return false
        }
        if user.age >= minimumAge { return true
        } else {
            return false
        }
    }
}
    
extension AppProtocol {
    static func printTerms() {
        print("Here are 50 pages of terms and conditions for you to read on a tiny phone screen.")
    }
    
}
struct User: UserProtocol {
    
    
    
    var funds: Decimal
    var age: Int
    var apps: [AppProtocol]
    
    mutating func buy(_ app: AppProtocol) -> Bool {
        let possible = app.canBePurchased(by: self)
        
        if possible {
            apps.append(app)
            funds -= app.price
            return true
        } else {
            return false
        }
        
    }
}



