//
//  InversionCountUsingMergeSort.swift
//  Algorithms2
//
//  Created by Adam on 21/06/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//
import Foundation


class InversionCountUsingMergeSort {
    func sort(A: inout [Int]) -> Int {
        return sort(array: &A, begin: 0, end: A.count)
    }
    
    func sort(array: inout [Int], begin: Int, end: Int) -> Int {
        var inversionCount = 0
        if begin < end - 1 {
            let mid = (begin+end)/2
            inversionCount += sort(array: &array, begin: begin, end: mid)
            inversionCount += sort(array: &array, begin: mid, end: end)
            inversionCount += merge(array: &array, begin: begin, mid: mid, end: end)
        }
        return inversionCount
    }
    
    func merge(array: inout [Int], begin: Int, mid: Int, end: Int) -> Int {
        var l = Array(array[begin ..< mid])
        var r = Array(array[mid ..< end])
        
        var i = 0
        var j = 0
        var k = 0
        var inversionCount = 0
        while i < l.count && j < r.count {
            if l[i] <= r[j] {
                array[begin+k] = l[i]
                i += 1
            } else {
                array[begin+k] = r[j]
                j += 1
                inversionCount = inversionCount + (l.count - i)
            }
            k += 1
        }
        while i < l.count {
            array[begin+k] = l[i]
            i += 1
            k += 1
        }
        while j < r.count {
            array[begin+k] = r[j]
            j += 1
            k += 1
        }
        
        return inversionCount
    }
}
