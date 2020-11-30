//
//  AddElementsOfTwoListsHeadLessSignificantBit.swift
//  Algorithms2
//
//  Created by Adam on 21/11/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//

import Foundation


class AddElementsOfTwoListsHeadLessSignificantBit {
    func sum(a: SingleLinkedList<Int>, b: SingleLinkedList<Int>) -> SingleLinkedList<Int> {
        if a.isEmpty() == true { return b }
        if b.isEmpty() == true { return a }
        
        let result = SingleLinkedListWithoutTail<Int>()
        
        var itA = a.head
        var itB = b.head
        
        var c : Int = 0
        
        while itA != nil || itB != nil {
            let sum = (itA?.data ?? 0) + (itB?.data ?? 0) + c
            if sum >= 10 {
                result.insertEnd(sum - 10)
                c = 1
            } else {
                result.insertEnd(sum )
                c = 0
            }
            itA = itA?.next
            itB = itB?.next
        }
        
        if c > 0 {
            result.insertEnd(c)
        }
        
        return result
    }
}
