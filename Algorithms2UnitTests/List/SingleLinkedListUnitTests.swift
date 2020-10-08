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
    
    func test_findMin_emptyList() {
        //given
        let list = SingleLinkedList<Int>()
        //when
        let actual = list.findMin()
        //then
        XCTAssertNil(actual)
    }
    
    func test_findMin_oneElement() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(10)
        //when
        let actual = list.findMin()
        //then
        XCTAssertEqual(10, actual)
    }
    
    func test_findMin_twoElements() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(10)
        list.insertBegin(1)
        //when
        let actual = list.findMin()
        //then
        XCTAssertEqual(1, actual)
    }
    
    func test_findMinRecursive_emptyList() {
        //given
        let list = SingleLinkedList<Int>()
        //when
        let actual = list.findMinRecursive()
        //then
        XCTAssertNil(actual)
    }
    
    func test_findMinRecursive_oneElement() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(10)
        //when
        let actual = list.findMinRecursive()
        //then
        XCTAssertEqual(10, actual)
    }
    
    func test_findMinRecursive_twoElements() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(10)
        list.insertBegin(1)
        //when
        let actual = list.findMinRecursive()
        //then
        XCTAssertEqual(1, actual)
    }
    
    func test_removeBegin_emptyList() {
        //given
        let list = SingleLinkedList<Int>()
        //when
        let actual = list.removeBegin()
        //then
        XCTAssertNil(actual)
    }
    
    func test_removeBegin_oneElement() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(11)
        //when
        let actual = list.removeBegin()
        //then
        XCTAssertEqual(11, actual)
    }
    
    func test_removeBegin_twoElements() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(11)
        list.insertBegin(10)
        //when
        let actual = list.removeBegin()
        //then
        XCTAssertEqual(10, actual)
    }
    
    func test_revert_emptyList() {
        //given
        let list = SingleLinkedList<Int>()
        //when
        list.revert()
        //then
        XCTAssertNil(nil)//test that there is no exception
    }
    
    func test_get_emptyList() {
        //given
        let list = SingleLinkedList<Int>()
        //when
        let actual = list.get(0)
        //then
        XCTAssertNil(actual)
    }
    
    func test_get_emptyList_indexOutOfRange() {
        //given
        let list = SingleLinkedList<Int>()
        //when
        let actual = list.get(1230)
        //then
        XCTAssertNil(actual)
    }
    
    func test_get_oneElement() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(1)
        //when
        let actual = list.get(0)
        //then
        XCTAssertEqual(1, actual)
    }
    
    func test_get_twoElements() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(1)
        list.insertBegin(2)
        //when
        let actual = list.get(1)
        //then
        XCTAssertEqual(1, actual)
    }
        
    func test_revert_oneElement() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(10)
        //when
        list.revert()
        let actual = list.get(0)
        //then
        XCTAssertEqual(10, actual)
    }
    
    func test_revert_twoElements() {
        //given
        let list = SingleLinkedList<Int>()
        list.insertBegin(10)
        list.insertBegin(20)
        //when
        list.revert()
        //then
        XCTAssertEqual(10, list.get(0))
        XCTAssertEqual(20, list.get(1))
    }
}
