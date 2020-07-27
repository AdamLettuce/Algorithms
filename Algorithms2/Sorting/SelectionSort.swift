//  Created by Adam on 25/05/2020.
import Foundation


class SelectionSort {
    func sort(A: inout [Int]) {
        for i in 0..<A.count-1 {
            var min = i
            for j in i+1..<A.count {
                if A[j] < A[min] {
                    min = j
                }
            }
            
            if min != i {
                let tmp = A[min]
                A[min] = A[i]
                A[i] = tmp
            }
        }
    }
}
