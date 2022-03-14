//
//  StringTool.swift
//  SYBasicToolsTests
//
//  Created by Yunis on 2022/3/13.
//

import XCTest
import SYBasicTools
class StringTool: XCTestCase {

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
    func testTrimALl_1 () throws {
        let str1 = "123 456"
        
        let r_str1 = str1.ssy.trim(.all)
        XCTAssertEqual(r_str1, "123456")
        
        
        let r_str1_1 = str1.ssy.trim(.head)
        XCTAssertEqual(r_str1_1, "123 456")
        
        let r_str1_2 = str1.ssy.trim(.end)
        XCTAssertEqual(r_str1_2, "123 456")
        
        
        let r_str1_3 = str1.ssy.trim(.headEnd)
        XCTAssertEqual(r_str1_3, "123 456")
    }
    
    func testTrimALl_2 () throws {
        let str1 = " 123456"
        
        let r_str1 = str1.ssy.trim(.all)
        XCTAssertEqual(r_str1, "123456")
        
        let r_str1_1 = str1.ssy.trim(.head)
        XCTAssertEqual(r_str1_1, "123456")
        
        let r_str1_2 = str1.ssy.trim(.end)
        XCTAssertEqual(r_str1_2, " 123456")
        
        
        let r_str1_3 = str1.ssy.trim(.headEnd)
        XCTAssertEqual(r_str1_3, "123456")
    }
    
    func testTrimALl_3 () throws {
        let str1 = "123456 "
        
        let r_str1 = str1.ssy.trim(.all)
        XCTAssertEqual(r_str1, "123456")
        
        let r_str1_1 = str1.ssy.trim(.head)
        XCTAssertEqual(r_str1_1, "123456 ")
        
        let r_str1_2 = str1.ssy.trim(.end)
        XCTAssertEqual(r_str1_2, "123456")
        
        
        let r_str1_3 = str1.ssy.trim(.headEnd)
        XCTAssertEqual(r_str1_3, "123456")
    }
    
    func testTrimALl_4 () throws {
        let str1 = " 123 456 "
        
        let r_str1 = str1.ssy.trim(.all)
        XCTAssertEqual(r_str1, "123456")
        
        let r_str1_1 = str1.ssy.trim(.head)
        XCTAssertEqual(r_str1_1, "123 456 ")
        
        let r_str1_2 = str1.ssy.trim(.end)
        XCTAssertEqual(r_str1_2, " 123 456")
        
        
        let r_str1_3 = str1.ssy.trim(.headEnd)
        XCTAssertEqual(r_str1_3, "123 456")
    }
    
    func testTrimALl_5 () throws {
        let str1 = "123456"
        
        let r_str1 = str1.ssy.trim(.all)
        XCTAssertEqual(r_str1, "123456")
        
        let r_str1_1 = str1.ssy.trim(.head)
        XCTAssertEqual(r_str1_1, "123456")
        
        let r_str1_2 = str1.ssy.trim(.end)
        XCTAssertEqual(r_str1_2, "123456")
        
        
        let r_str1_3 = str1.ssy.trim(.headEnd)
        XCTAssertEqual(r_str1_3, "123456")
    }
    func testTrimALl_6 () throws {
        let str1 = "  1 2 3 4 5 6  "
        
        let r_str1 = str1.ssy.trim(.all)
        XCTAssertEqual(r_str1, "123456")
        
        let r_str1_1 = str1.ssy.trim(.head)
        XCTAssertEqual(r_str1_1, "1 2 3 4 5 6  ")
        
        let r_str1_2 = str1.ssy.trim(.end)
        XCTAssertEqual(r_str1_2, "  1 2 3 4 5 6")
        
        
        let r_str1_3 = str1.ssy.trim(.headEnd)
        XCTAssertEqual(r_str1_3, "1 2 3 4 5 6")
    }
    
    

    func testBeginSpaceNum_1()  throws{
        let str = "123"
        let str1 = str.ssy.beginSpaceNum(num: 2)
        XCTAssertEqual(str1, "  123")
        
        
        let str2 = str.ssy.beginSpaceNum(num: 0)
        XCTAssertEqual(str2, "123")
        
        let str3 = str.ssy.beginSpaceNum(num: -1)
        XCTAssertEqual(str3, "123")
    }
    
    func testBeginSpaceNum_2()  throws{
        let str = " 123"
        let str1 = str.ssy.beginSpaceNum(num: 2)
        XCTAssertEqual(str1, "  123")
        
        let str2 = str.ssy.beginSpaceNum(num: 0)
        XCTAssertEqual(str2, "123")
        
        let str3 = str.ssy.beginSpaceNum(num: -1)
        XCTAssertEqual(str3, " 123")
    }
    
    func testBeginSpaceNum_3()  throws{
        let str = " 123 "
        let str1 = str.ssy.beginSpaceNum(num: 2)
        XCTAssertEqual(str1, "  123 ")
        
        let str2 = str.ssy.beginSpaceNum(num: 0)
        XCTAssertEqual(str2, "123 ")
        
        let str3 = str.ssy.beginSpaceNum(num: -1)
        XCTAssertEqual(str3, " 123 ")
    }
}
