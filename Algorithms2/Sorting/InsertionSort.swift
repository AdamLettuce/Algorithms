//  Created by Adam on 04/05/2020.
import Foundation


class InsertionSort {
    func sort(_ data: [Int]) -> [Int] {
        if data.isEmpty || data.count == 1 {
            return data
        }
        var result: [Int] = []
        result.append(contentsOf: data)
        
        for i in 1 ..< result.count {
            let tmp = result[i]
            var j = i - 1
            while j>=0 && tmp < result[j] {
                result[j+1] = result[j]
                j -= 1                
            }
            result[j+1] = tmp
        }
        
        return result
    }
}
