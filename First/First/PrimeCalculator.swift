//
//  PrimeCalculator.swift
//  First
//
//  Created by Bryan Cuevas on 5/1/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

struct PrimeCalculator {
    
    static func calculate(upTo max: Int, completion: @escaping ([Int]) -> Void) -> Progress {
        // create a Progress object that counts up to our maximum
        let progress = Progress(totalUnitCount: Int64(max))
        
        //Push our work straight to a background thread.
        DispatchQueue.global().async {
            guard max > 1 else {
                // If the input value is 0 or 1 exit immediately
                completion([])
                return
            }
            //mark all our numbers as prime
            var sieve = [Bool](repeating: true, count: max)
            
            //0 and 1 are by definition as prime
            sieve[0] = false
            sieve[1] = false
            
            //ad 2 to our progress counter, because we already went through 0 and 1.
            progress.completedUnitCount += 2
            
            //count from 0 up to the ceiling...
            for number in 2 ..< max {
                //if this is marked as prime, then every multiple of it is not prime
                progress.completedUnitCount += 1
                if sieve[number] == true {
                    for mulitple in stride(from: number * number, to: sieve.count, by: number) {
                        sieve[mulitple] = false
                    }
                }
            }
            
            //Collapse our results down to a single array of primes
            let primes = sieve.enumerated().compactMap {$1 == true ? $0 : nil}
            completion(primes)
        }
        return progress
    }
    
    static func calculateStreaming(upTo max: Int, completion:@escaping (Int) -> Void) {
        DispatchQueue.global().async {
            guard max > 1 else { return }
            
            var sieve = [Bool](repeating: true, count: max)
            sieve[0] = false
            sieve[1] = false
            
            for number in 2 ..< max {
                if sieve[number] == true {
                    for multiple in stride(from: number * number, to: sieve.count , by: number) {
                        sieve[multiple] = false
                    }
                    completion(number)
                }
            }
        }
    }
    
    
}
