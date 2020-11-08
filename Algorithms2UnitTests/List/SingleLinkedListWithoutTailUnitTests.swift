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
    
    func test_removeBegin_emptyList_sizeZero() {
        //given
        let list = newInstance()
        //when
        let _ = list.removeBegin()
        //then
        XCTAssertEqual(0, list.size())
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
    
    func test_removeAtZeroPosition_listWithThreeElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(1)
        list.insertEnd(2)
        list.insertEnd(3)
        let reslut = list.removeAt(index: 0)
        //then
        XCTAssertEqual(1, reslut)
        XCTAssertEqual(2, list.get(0))
        XCTAssertEqual(3, list.get(1))
    }
    
    func test_removeAtFirstPosition_listWithThreeElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(1)
        list.insertEnd(2)
        list.insertEnd(3)
        let reslut = list.removeAt(index: 1)
        //then
        XCTAssertEqual(2, reslut)
        XCTAssertEqual(1, list.get(0))
        XCTAssertEqual(3, list.get(1))
    }
    
    func test_removeAtLastPosition_listWithThreeElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(1)
        list.insertEnd(2)
        list.insertEnd(3)
        let reslut = list.removeAt(index: 2)
        //then
        XCTAssertEqual(3, reslut)
        XCTAssertEqual(1, list.get(0))
        XCTAssertEqual(2, list.get(1))
    }
    
    func test_removeFirstWithKey_emptyList() {
        //given
        let list = newInstance()
        //when
        let reslut = list.removeFirstWith(key: 3)
        //then
        XCTAssertNil(reslut)
    }
    
    func test_removeFirstWithKey_listWithOneElement() {
        //given
        let list = newInstance()
        list.insertEnd(10)
        //when
        let reslut = list.removeFirstWith(key: 10)
        //then
        XCTAssertEqual(10, reslut)
    }
    
    func test_removeFirstWithKey_listWithThreeElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(3)
        list.insertEnd(2)
        list.insertEnd(3)
        let reslut = list.removeFirstWith(key: 3)
        //then
        XCTAssertEqual(3, reslut)
        XCTAssertEqual(2, list.get(0))
        XCTAssertEqual(3, list.get(1))
    }
    
    func test_removeSecondWithKey_listWithFourElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(3)
        list.insertEnd(2)
        list.insertEnd(3)
        list.insertEnd(2)
        let reslut = list.removeFirstWith(key: 2)
        //then
        XCTAssertEqual(2, reslut)
        XCTAssertEqual(3, list.get(0))
        XCTAssertEqual(3, list.get(1))
        XCTAssertEqual(2, list.get(2))
    }
    
    func test_removeLastWithKey_listWithTwoElements() {
        //given
        let list = newInstance()
        //when
        list.insertEnd(1)
        list.insertEnd(2)
        list.insertEnd(3)
        let reslut = list.removeFirstWith(key: 3)
        //then
        XCTAssertEqual(3, reslut)
        XCTAssertEqual(1, list.get(0))
        XCTAssertEqual(2, list.get(1))
    }
    
    func test_removeAt_emptyList() {
        //given
        let list = newInstance()
        //when
        let reslut = list.removeAt(index: 2)
        //then
        XCTAssertNil(reslut)
    }
    
    func test_removeEnd_emptyList() {
        //given
        let list = newInstance()
        //when
        let reslut = list.removeEnd()
        //then
        XCTAssertNil(reslut)
    }
    
    func test_removeEnd_listWithOneElement() {
        //given
        let list = newInstance()
        list.insertEnd(10)
        //when
        let reslut = list.removeEnd()
        //then
        XCTAssertEqual(10,reslut)
    }
    
    func test_removeEnd_listWithTwoElements() {
        //given
        let list = newInstance()
        list.insertEnd(10)
        list.insertEnd(20)
        //when
        let reslut = list.removeEnd()
        //then
        XCTAssertEqual(20,reslut)
    }
    
    func test_removeAllWithKey_emptyList() {
        //given
        let list = newInstance()
        //when
        let result = list.removeAllWith(key: 10)
        //then
        XCTAssertEqual(0, result)
    }
    
    func test_removeAllWithKey_listWithOneNonMatchingElement() {
        //given
        let list = newInstance()
        list.insertEnd(5)
        //when
        let result = list.removeAllWith(key: 10)
        //then
        XCTAssertEqual(0, result)
    }
    
    func test_removeAllWithKey_listWithOneMatchingElementAtTheBeginning() {
        //given
        let list = newInstance()
        list.insertEnd(5)
        //when
        let result = list.removeAllWith(key: 5)
        //then
        XCTAssertEqual(1, result)
    }
    
    func test_removeAllWithKey_listWithTwoMatchingElementsAtTheBeginning() {
        //given
        let list = newInstance()
        list.insertEnd(5)
        list.insertEnd(5)
        //when
        let result = list.removeAllWith(key: 5)
        //then
        XCTAssertEqual(2, result)
    }
    
    func test_removeAllWithKey_listWithOneMatchingElementAtTheEnd() {
        //given
        let list = newInstance()
        list.insertEnd(4)
        list.insertEnd(5)
        //when
        let result = list.removeAllWith(key: 5)
        //then
        XCTAssertEqual(1, result)
    }
    
    func test_removeAllWithKey_listWithTwoMatchingElementsAtTheEnd() {
        //given
        let list = newInstance()
        list.insertEnd(4)
        list.insertEnd(5)
        list.insertEnd(5)
        //when
        let result = list.removeAllWith(key: 5)
        //then
        XCTAssertEqual(2, result)
    }
    
    func test_removeAllWithKey_listWithOneMatchingElementAtTheBeginningAndAtTheEnd() {
        //given
        let list = newInstance()
        list.insertEnd(5)
        list.insertEnd(4)
        list.insertEnd(5)
        //when
        let result = list.removeAllWith(key: 5)
        //then
        XCTAssertEqual(2, result)
    }
    
    func test_removeAllWithKey_listWithOneMatchingElementAtTheMiddle() {
        //given
        let list = newInstance()
        list.insertEnd(4)
        list.insertEnd(5)
        list.insertEnd(4)
        //when
        let result = list.removeAllWith(key: 5)
        //then
        XCTAssertEqual(1, result)
    }
    
    func test_removeAllWithKey_listWithOneMatchingElementAtTheBeginningAtTheMiddleAndAtTheEnd() {
        //given
        let list = newInstance()
        list.insertEnd(5)
        list.insertEnd(4)
        list.insertEnd(5)
        list.insertEnd(4)
        list.insertEnd(5)
        //when
        let result = list.removeAllWith(key: 5)
        //then
        XCTAssertEqual(3, result)
    }
    
    func test_removeAllWithKey_listWithMatchingElementsAtTheBeginningAtTheMiddleAndAtTheEnd() {
        //given
        let list = newInstance()
        list.insertEnd(5)
        list.insertEnd(5)
        list.insertEnd(4)
        list.insertEnd(5)
        list.insertEnd(5)
        list.insertEnd(5)
        list.insertEnd(4)
        list.insertEnd(5)
        list.insertEnd(5)
        //when
        let result = list.removeAllWith(key: 5)
        //then
        XCTAssertEqual(7, result)
    }
    
    func test_toStringReverted_emptyList() {
        //given
        let list = newInstance()
        //when
        let result = list.toStringReverted()
        //then
        XCTAssertEqual("[]", result)
    }
    
    func test_toStringReverted_oneElement() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        //when
        let result = list.toStringReverted()
        //then
        XCTAssertEqual("[1]", result)
    }
    
    func test_toStringReverted_twoElements() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        list.insertEnd(2)        
        //when
        let result = list.toStringReverted()
        //then
        XCTAssertEqual("[2, 1]", result)
    }
    
    func test_toStringReverted_threeElements() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        list.insertEnd(2)
        list.insertEnd(3)
        //when
        let result = list.toStringReverted()
        //then
        XCTAssertEqual("[3, 2, 1]", result)
    }
    
    func test_hasCycle_emptyList_noCycle() {
        //given
        let list = newInstance()
        //when
        let result = list.hasCycle()
        //then
        XCTAssertFalse(result)
    }
    
    func test_hasCycle_oneElement_noCycle() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        //when
        let result = list.hasCycle()
        //then
        XCTAssertFalse(result)
    }
    
    func test_hasCycle_twoElements_noCycle() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        list.insertEnd(2)
        //when
        let result = list.hasCycle()
        //then
        XCTAssertFalse(result)
    }
    
    func test_hasCycle_threeElements_noCycle() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        list.insertEnd(2)
        list.insertEnd(3)
        //when
        let result = list.hasCycle()
        //then
        XCTAssertFalse(result)
    }
    
    func test_hasCycle_oneElement_hasCycle() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        list.createCycleBetween(first: list.nodeAt(0)!, second: list.nodeAt(0)!)
        //when
        let result = list.hasCycle()
        //then
        XCTAssertTrue(result)
    }
    
    func test_hasCycle_twoElements_hasCycle() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        list.insertEnd(2)
        list.createCycleBetween(first: list.nodeAt(0)!, second: list.nodeAt(1)!)
        //when
        let result = list.hasCycle()
        //then
        XCTAssertTrue(result)
    }
    
    func test_hasCycle_threeElements_hasCycle() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        list.insertEnd(2)
        list.insertEnd(3)
        list.createCycleBetween(first: list.nodeAt(0)!, second: list.nodeAt(2)!)
        //when
        let result = list.hasCycle()
        //then
        XCTAssertTrue(result)
    }
    
    func test_hasCycle_fourElements_hasCycle() {
        //given
        let list = newInstance()
        list.insertEnd(1)
        list.insertEnd(2)
        list.insertEnd(3)
        list.insertEnd(4)
        list.createCycleBetween(first: list.nodeAt(2)!, second: list.nodeAt(3)!)
        //when
        let result = list.hasCycle()
        //then
        XCTAssertTrue(result)
    }
    
    func test_removeDuplicates_emptyList() {
        //given
        let list = newInstance()
        //when
        list.removeDuplicatesWithAdditionalCollection()
        //then
        XCTAssertEqual(0,list.size())
    }
    
    func test_removeDuplicatesWithAdditionalCollection_listWithOneElement() {
        //given
        let list = newInstance()
        list.insertEnd(10)
        //when
        list.removeDuplicatesWithAdditionalCollection()
        //then
        XCTAssertEqual(1,list.size())
    }
    
    func test_removeDuplicatesWithAdditionalCollection_listWithTwoElements() {
        //given
        let list = newInstance()
        list.insertEnd(10)
        list.insertEnd(10)
        //when
        list.removeDuplicatesWithAdditionalCollection()
        //then
        XCTAssertEqual(1,list.size())
    }
    
    func test_removeDuplicatesWithAdditionalCollection_listWithThreeElements() {
        //given
        let list = newInstance()
        list.insertEnd(10)
        list.insertEnd(10)
        list.insertEnd(10)
        //when
        list.removeDuplicatesWithAdditionalCollection()
        //then
        XCTAssertEqual(1,list.size())
    }
    
    func test_removeDuplicatesWithAdditionalCollection_listWithFiveTwoDifferentElements() {
        //given
        let list = newInstance()
        list.insertEnd(10)
        list.insertEnd(20)
        list.insertEnd(10)
        list.insertEnd(10)
        list.insertEnd(20)
        //when
        list.removeDuplicatesWithAdditionalCollection()
        //then
        XCTAssertEqual(2,list.size())
    }
    
    func newInstance() -> SingleLinkedList<Int> {
        return SingleLinkedListWithoutTail<Int>()
    }

}
