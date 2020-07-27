//  Created by Adam on 02/06/2020.
import Foundation


class ShellSort {
    func sort(A: inout [Int]) {
        let n = A.count
        var h = 1
        while h < n / 3 {
            h = 3*h+1
        }
        while h>=1 {
            for i in h ..< A.count {
                var j = i - h
                let key = A[i]
                while j >= 0 && key < A[j] {
                    A[j+h] = A[j]
                    j -= h
                }
                A[j+h] = key
            }
            h = h/3
        }
    }
}
