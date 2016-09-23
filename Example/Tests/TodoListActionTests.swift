//
//  TodoListActionTests.swift
//  Redux
//
//  Created by Steven Chan on 5/1/16.
//  Copyright (c) 2016 Oursky Limited. All rights reserved.
//

import XCTest
import Redux

class TodoListActionTests: XCTestCase {

    let mockUserDefaults: UserDefaults =
        UserDefaults(suiteName: "TodoListActionTests")!
    let mockDispatch: MockDispatch = createMockDispatch()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()

        let dict = mockUserDefaults.dictionaryRepresentation()
        for (k, _) in dict {
            mockUserDefaults.removeObject(forKey: k)
        }
        mockDispatch.cleanup()
    }

}
