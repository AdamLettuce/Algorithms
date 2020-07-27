//  Created by Adam on 08/05/2020.
import Foundation


class BinarySearch {
    func find(key: Int, A: [Int]) -> Int {
        return find(key, 0, A.count, A)
    }
    
    func find(_ key: Int, _ lo: Int, _ hi: Int, _ A: [Int]) -> Int {
        if lo >= hi {
            return -1
        }
        let mid = (lo+hi)/2
        if key == A[mid] {
            return mid
        }
        if key < A[mid] {
            return find(key,lo,mid,A)
        }
        return find(key,mid+1,hi,A)
    }
    
    func find2(key: Int, A: [Int]) -> Int {
        var lo = 0
        var hi = A.count
        while lo < hi {
            let mid = (lo+hi)/2
            if key == A[mid] {
                return mid
            }
            if key < A[mid] {
                hi = mid
            }
            else {
                lo = mid + 1
            }
        }
        return -1
    }
}
