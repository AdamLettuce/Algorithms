//
//  AddElementsOfTwoListsHeadLessSignificantBitTests.swift
//  Algorithms2UnitTests
//
//  Created by Adam on 21/11/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//

import XCTest

class AddElementsOfTwoListsHeadLessSignificantBitTest : XCTestCase {
    
    func test_sumTwoDigitsWithoutOverflow() {
        //given
        let a = newInstance()
        a.insertEnd(1)
        let b = newInstance()
        b.insertEnd(2)
        //when
        let actual = AddElementsOfTwoListsHeadLessSignificantBit().sum(a: a, b: b)
        //then
        XCTAssertEqual(3, actual.get(0))
    }
    
    func test_sumTwoNumbersWithOverflow() {
        //given
        let a = newInstance()
        a.insertEnd(9)
        let b = newInstance()
        b.insertEnd(9)
        //when
        let actual = AddElementsOfTwoListsHeadLessSignificantBit().sum(a: a, b: b)
        //then
        XCTAssertEqual(8, actual.get(0))
        XCTAssertEqual(1, actual.get(1))
    }
    
    func test_sumTwoNumbersDifferentLengthOverflowLongerFirst() {
        //given
        let a = newInstance()
        a.insertEnd(9)
        a.insertEnd(1)
        let b = newInstance()
        b.insertEnd(9)
        //when
        let actual = AddElementsOfTwoListsHeadLessSignificantBit().sum(a: a, b: b)
        //then
        XCTAssertEqual(8, actual.get(0))
        XCTAssertEqual(2, actual.get(1))
    }
    
    func test_sumTwoNumbersDifferentLengthOverflowShorterFirst() {
        //given
        let a = newInstance()
        a.insertEnd(9)
        a.insertEnd(1)
        let b = newInstance()
        b.insertEnd(9)
        //when
        let actual = AddElementsOfTwoListsHeadLessSignificantBit().sum(a: b, b: a)
        //then
        XCTAssertEqual(8, actual.get(0))
        XCTAssertEqual(2, actual.get(1))
    }
    
    // 899
    //+  9
    // 908
    func test_sumTwoNumbersDifferentLengthOverflow() {
        //given
        let a = newInstance()
        a.insertEnd(9)
        a.insertEnd(9)
        a.insertEnd(8)
        let b = newInstance()
        b.insertEnd(9)
        //when
        let actual = AddElementsOfTwoListsHeadLessSignificantBit().sum(a: a, b: b)
        //then
        XCTAssertEqual(8, actual.get(0))
        XCTAssertEqual(0, actual.get(1))
        XCTAssertEqual(9, actual.get(2))
    }
    
    //  998
    //+   9
    // 1007
    func test_sumTwoNumbersDifferentLengthOverflow1() {
        //given
        let a = newInstance()
        a.insertEnd(8)
        a.insertEnd(9)
        a.insertEnd(9)
        let b = newInstance()
        b.insertEnd(9)
        //when
        let actual = AddElementsOfTwoListsHeadLessSignificantBit().sum(a: a, b: b)
        //then
        XCTAssertEqual(7, actual.get(0))
        XCTAssertEqual(0, actual.get(1))
        XCTAssertEqual(0, actual.get(2))
        XCTAssertEqual(1, actual.get(3))        
    }
    
    func test_sumTwoNumbersDifferentLengthOverflow2() {
        //given
        let a = newInstance()
        a.insertEnd(7)
        a.insertEnd(1)
        a.insertEnd(6)
        let b = newInstance()
        b.insertEnd(5)
        b.insertEnd(9)
        b.insertEnd(2)
        //when
        let actual = AddElementsOfTwoListsHeadLessSignificantBit().sum(a: a, b: b)
        //then
        XCTAssertEqual(2, actual.get(0))
        XCTAssertEqual(1, actual.get(1))
        XCTAssertEqual(9, actual.get(2))
    }
    
    func newInstance() -> SingleLinkedList<Int> {
        return SingleLinkedListWithoutTail<Int>()
    }
    
}
