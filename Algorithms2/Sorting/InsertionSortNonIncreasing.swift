//  Created by Adam on 05/05/2020.
import Foundation


class InsertionSortNonIncreasing {
    func sort(_ A: [Int]) -> [Int] {
        if A.isEmpty || A.count == 1 {
            return A
        }
        
        var B: [Int] = []
        B.append(contentsOf: A)
        
        for i in 1 ..< A.count {
           var j = i - 1
            let key = B[i]
            while j >= 0 && key > B[j] {
                B[j+1] = B[j]
                j -= 1
            }
            B[j+1] = key
        }
        
        return B
    }
}
