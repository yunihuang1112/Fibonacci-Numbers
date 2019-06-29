//
//  FibonacciManager.swift
//  Fibonacci
//
//  Created by YUNI on 2019/6/29.
//  Copyright © 2019 YUNI. All rights reserved.
//

import UIKit

enum FibonacciError: Error {
    case Invaild
    case OverMax
}

class FibonacciManager: NSObject {
    static let shared = FibonacciManager()
    fileprivate var max = Int.max
    
    private override init() {
        super.init()
        
        max = Int.max/2
    }
    
    fileprivate func isNumberVaild(num: Int) -> Bool {
        if num < 0 {
            return false
        }
        
        return true
    }
    
    func getNumber(number: Int) throws -> Int {
        if !isNumberVaild(num: number) {
            throw FibonacciError.Invaild
        }

        var results: [Int] = []
        results.append(0)
        results.append(1)
        results.append(1)

        if number == 0 {
            return results[0]
        } else if number == 1 {
            return results[1]
        }

        for _ in stride(from: 2, to: number+1, by: 1) {
            if results[0] > max || results[1] > max {
                throw FibonacciError.OverMax
            }
            results[2] = results[0] + results[1]
            results[0] = results[1]
            results[1] = results[2]
        }

        return results[2]
    }

    func getListToNumber(to: Int) throws -> [Int] {
        if !isNumberVaild(num: to) {
            throw FibonacciError.Invaild
        }
        
        var results: [Int] = []
        results.append(0)
        results.append(1)
        
        var temp: [Int] = []
        temp.append(0)
        temp.append(1)
        
        for i in stride(from: 2, to: to+1, by: 1) {
            temp[0] = results[i-2]
            temp[1] = results[i-1]
            if temp[0] > max || temp[1] > max {
                throw FibonacciError.OverMax
            }
            results.append(temp[0] + temp[1])
            /* Use recursive will be slower. */
//            results.append(cal(number: i))
        }
        
        return results
    }
    
    func getRangeList(from: Int, to: Int) throws -> [Int] {
        if !isNumberVaild(num: from) || !isNumberVaild(num: to) {
            throw FibonacciError.Invaild
        }
        
        let results: [Int] = try getListToNumber(to: to+1)
        return Array(results[from..<to+1])
    }
    
    func cal(number: Int) -> Int {
        if number == 0 {
            return 0
        } else if number == 1 {
            return 1
        }
        
        return cal(number: number-1) + cal(number: number-2)
    }
}
