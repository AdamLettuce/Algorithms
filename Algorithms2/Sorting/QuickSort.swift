//  Created by Adam on 02/06/2020.
import Foundation


class QuickSort {
    func sort(A: inout [Int]) {
        sort(A: &A, lo: 0, hi: A.count-1)
    }
    
    func sort(A: inout [Int], lo: Int, hi: Int) {
        if hi <= lo {
            return
        }
        let j = partition(A: &A, lo: lo, hi: hi)
        sort(A: &A,lo: lo,hi: j-1)
        sort(A: &A,lo: j+1,hi: hi)
    }
    
    func partition(A: inout [Int], lo: Int, hi: Int) -> Int {
        var i = lo
        var j = hi+1
        let v = A[lo]
        while(true) {
            repeat {
                i += 1
            } while A[i] < v && i != hi
            
            repeat {
                j -= 1
            } while v < A[j] && j != lo
            
            if i >= j {
                break
            }
            exchange(A: &A, lo: i, hi: j)
        }
        exchange(A: &A, lo: lo, hi: j)
        return j
    }
    
    func exchange(A: inout [Int], lo: Int, hi: Int) {
        let tmp = A[lo]
        A[lo] = A[hi]
        A[hi] = tmp
    }
}
