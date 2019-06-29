//
//  FibonacciTests.swift
//  FibonacciTests
//
//  Created by YUNI on 2019/6/29.
//  Copyright © 2019 YUNI. All rights reserved.
//

import XCTest
@testable import Fibonacci

class FibonacciTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        do {
            let no0 = try FibonacciManager.shared.getNumber(no: 0)
            XCTAssertEqual(no0, 0, "")
            let no1 = try FibonacciManager.shared.getNumber(no: 1)
            XCTAssertEqual(no1, 1, "")
            let no5 = try FibonacciManager.shared.getNumber(no: 5)
            XCTAssertEqual(no5, 5, "")
            
            let listTo5 = try FibonacciManager.shared.getListToNumber(to: 5)
            XCTAssertEqual(listTo5, [0, 1, 1, 2, 3, 5], "")
            
            let range = try FibonacciManager.shared.getRangeList(from: 1, to: 4)
            XCTAssertEqual(range, [1, 1, 2, 3], "")
            
        } catch FibonacciError.Invaild {
            
        } catch FibonacciError.OverMax {

        } catch {
            
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
