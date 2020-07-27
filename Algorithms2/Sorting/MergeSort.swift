//  Created by Adam on 23/05/2020.
import Foundation


class MergeSort {
    func sort(A: inout [Int]) {
        sort(array: &A, begin: 0, end: A.count)
    }
    
    func sort(array: inout [Int], begin: Int, end: Int) {
        if begin < end - 1 {
            let mid = (begin+end)/2
            sort(array: &array, begin: begin, end: mid)
            sort(array: &array, begin: mid, end: end)
            
            var l: [Int] = Array.init(repeating: 0, count: mid-begin)
            for i in begin ..< mid {
                l[i-begin] = array[i]
            }
            var r: [Int] = Array.init(repeating: 0, count: end-mid)
            for i in mid ..< end {
                r[i-mid] = array[i]
            }
            
            var i = 0
            var j = 0
            var k = 0
            while i < l.count && j < r.count {
                if l[i] < r[j] {
                    array[begin+k] = l[i]
                    i += 1
                } else {
                    array[begin+k] = r[j]
                    j += 1
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
            
        }
    }
}
