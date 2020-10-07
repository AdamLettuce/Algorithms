//
//  LinkedListUnitTests.swift
//  Algorithms2UnitTests
//
//  Created by Adam on 23/08/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//
import XCTest


class SingleLinkedListUnitTests: XCTestCase {
    
    func test_addFirst() {
        let list = SingleLinkedList<Int>()
        list.insertBegin(1)
        XCTAssertFalse(list.isEmpty())
    }
    
    func test_removeBegin_fromEmptyList() {
        //given
        let list = SingleLinkedList<Int>()
        //when
        let removed = list.removeBegin()
        //then
        XCTAssertNil(removed)
    }
    
    func test_removeBegin_fromListWithOneElement() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(10)
        //when
        let removed = list.removeBegin()
        //then
        XCTAssertEqual(removed, 10)
    }
    
    func test_removeBeginTwice_fromListWithOneElement() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(10)
        //when
        let removed = list.removeBegin()
        //then
        XCTAssertEqual(removed, 10)
        XCTAssertNil(list.removeBegin())
    }
}
