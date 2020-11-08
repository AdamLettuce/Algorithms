//
//  SingleLinkedListWithTail.swift
//  Algorithms2UnitTests
//
//  Created by Adam on 05/11/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//

import XCTest

class SingleLinkedListWithTailUnitTests: XCTestCase {
    
    func test_removeBegin_fromEmptyList() {
        //given
        let list = newInstance()
        //when
        let removed = list.removeBegin()
        //then
        XCTAssertNil(removed)
    }
    
    func test_removeBegin_fromListWithOneElement() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        //when
        let removed = list.removeBegin()
        //then
        XCTAssertEqual(removed, 10)
    }
    
    func test_removeBeginTwice_fromListWithOneElement() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        //when
        let removed = list.removeBegin()
        //then
        XCTAssertEqual(removed, 10)
        XCTAssertNil(list.removeBegin())
    }
 
    func newInstance() -> SingleLinkedList<Int> {
        return SingleLinkedListWithTail<Int>()
    }
    
}
