//
//  LinkedListUnitTests.swift
//  Algorithms2UnitTests
//
//  Created by Adam on 23/08/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//
import XCTest


class SingleLinkedListWithoutTailUnitTests: XCTestCase {
    
    func test_addFirst() {
        let list = newInstance()
        list.insertBegin(1)
        XCTAssertFalse(list.isEmpty())
    }
    
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
    
    func test_findMin_emptyList() {
        //given
        let list = newInstance()
        //when
        let actual = list.findMin()
        //then
        XCTAssertNil(actual)
    }
    
    func test_findMin_oneElement() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        //when
        let actual = list.findMin()
        //then
        XCTAssertEqual(10, actual)
    }
    
    func test_findMin_twoElements() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        list.insertBegin(1)
        //when
        let actual = list.findMin()
        //then
        XCTAssertEqual(1, actual)
    }
    
    func test_findMinRecursive_emptyList() {
        //given
        let list = newInstance()
        //when
        let actual = list.findMinRecursive()
        //then
        XCTAssertNil(actual)
    }
    
    func test_findMinRecursive_oneElement() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        //when
        let actual = list.findMinRecursive()
        //then
        XCTAssertEqual(10, actual)
    }
    
    func test_findMinRecursive_twoElements() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        list.insertBegin(1)
        //when
        let actual = list.findMinRecursive()
        //then
        XCTAssertEqual(1, actual)
    }
    
    func test_removeBegin_emptyList() {
        //given
        let list = newInstance()
        //when
        let actual = list.removeBegin()
        //then
        XCTAssertNil(actual)
    }
    
    func test_removeBegin_oneElement() {
        //given
        let list = newInstance()
        list.insertBegin(11)
        //when
        let actual = list.removeBegin()
        //then
        XCTAssertEqual(11, actual)
    }
    
    func test_removeBegin_twoElements() {
        //given
        let list = newInstance()
        list.insertBegin(11)
        list.insertBegin(10)
        //when
        let actual = list.removeBegin()
        //then
        XCTAssertEqual(10, actual)
    }
    
    func test_revert_emptyList() {
        //given
        let list = newInstance()
        //when
        list.revert()
        //then
        XCTAssertNil(nil)//test that there is no exception
    }
    
    func test_get_emptyList() {
        //given
        let list = newInstance()
        //when
        let actual = list.get(0)
        //then
        XCTAssertNil(actual)
    }
    
    func test_get_emptyList_indexOutOfRange() {
        //given
        let list = newInstance()
        //when
        let actual = list.get(1230)
        //then
        XCTAssertNil(actual)
    }
    
    func test_get_oneElement() {
        //given
        let list = newInstance()
        list.insertBegin(1)
        //when
        let actual = list.get(0)
        //then
        XCTAssertEqual(1, actual)
    }
    
    func test_get_twoElements() {
        //given
        let list = newInstance()
        list.insertBegin(1)
        list.insertBegin(2)
        //when
        let actual = list.get(1)
        //then
        XCTAssertEqual(1, actual)
    }
        
    func test_revert_oneElement() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        //when
        list.revert()
        let actual = list.get(0)
        //then
        XCTAssertEqual(10, actual)
    }
    
    func test_revert_twoElements() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        list.insertBegin(20)
        //when
        list.revert()
        //then
        XCTAssertEqual(10, list.get(0))
        XCTAssertEqual(20, list.get(1))
    }
    
    func test_findKthFromTheEnd_emptyList() {
        //given
        let list = newInstance()
        //when
        let actual = list.findKthFromTheEnd(1)
        //then
        XCTAssertNil(actual)
    }
    
    func test_find0thFromTheEnd() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        //when
        let actual = list.findKthFromTheEnd(0)
        //then
        XCTAssertNil(actual)
    }
    
    func test_findMinus1stFromTheEnd() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        //when
        let actual = list.findKthFromTheEnd(-1)
        //then
        XCTAssertNil(actual)
    }
    
    func test_find1stFromTheEnd() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        list.insertBegin(20)
        //when
        let actual = list.findKthFromTheEnd(1)
        //then
        XCTAssertEqual(10, actual!.data)
    }
    
    func test_find2ndFromTheEnd() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        list.insertBegin(20)
        //when
        let actual = list.findKthFromTheEnd(2)
        //then
        XCTAssertEqual(20, actual!.data)
    }
    
    func test_find3rdFromTheEnd() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        list.insertBegin(20)
        list.insertBegin(30)
        list.insertBegin(40)
        //when
        let actual = list.findKthFromTheEnd(3)
        //then
        XCTAssertEqual(30, actual!.data)
    }
    
    func test_find5thFromTheEnd() {
        //given
        let list = newInstance()
        list.insertBegin(10)
        list.insertBegin(20)
        list.insertBegin(30)
        list.insertBegin(40)
        //when
        let actual = list.findKthFromTheEnd(7)
        //then
        XCTAssertNil(actual)
    }
    
    func test_insertEnd_oneElement() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(1)
        //then
        XCTAssertFalse(list.isEmpty())
    }
    
    func test_insertEnd_twoElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(1)
        list.insertEnd(2)
        list.insertEnd(3)
        //then
        XCTAssertEqual(1, list.get(0))
        XCTAssertEqual(2, list.get(1))
        XCTAssertEqual(3, list.get(2))
    }
    
    func test_insert_atPosition0_emptyList() {
        //given
        let list = newInstance()
        //when
        list.insert(1,atPosition: 0)
        //then
        XCTAssertEqual(1, list.get(0))
    }
    
    func test_insert_atPositionMinus1_emptyList() {
        //given
        let list = newInstance()
        //when
        list.insert(1,atPosition: -1)
        //then
        XCTAssertEqual(1, list.get(0))
    }
    
    func test_insert_atPosition1_emptyList() {
        //given
        let list = newInstance()
        //when
        list.insert(1,atPosition: 1)
        //then
        XCTAssertEqual(1, list.get(0))
    }
   
    func test_insert_atPositionMinus10_listWithTwoElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(1)
        list.insertEnd(3)
        list.insert(2,atPosition: -10)
        //then
        XCTAssertEqual(2, list.get(0))
        XCTAssertEqual(1, list.get(1))
        XCTAssertEqual(3, list.get(2))
    }
    
    func test_insert_atPosition10_listWithTwoElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(1)
        list.insertEnd(3)
        list.insert(2,atPosition: 10)
        //then
        XCTAssertEqual(1, list.get(0))
        XCTAssertEqual(3, list.get(1))
        XCTAssertEqual(2, list.get(2))
    }
    
    func test_insert_atPosition1_listWithTwoElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(1)
        list.insertEnd(3)
        list.insert(2,atPosition: 1)
        //then
        XCTAssertEqual(1, list.get(0))
        XCTAssertEqual(2, list.get(1))
        XCTAssertEqual(3, list.get(2))
    }
    
    func newInstance() -> SingleLinkedList<Int> {
        return SingleLinkedListWithoutTail<Int>()
    }
    
    
    

}
