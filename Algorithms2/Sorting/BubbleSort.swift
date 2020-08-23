//  Created by Adam on 07/08/2020.
import Foundation

    
class BubbleSort {
    func sort(data: inout [Int]) {
        for j in 1 ..< data.count {
            for i in 1 ..< data.count - j + 1 {
                if data[i-1] > data[i] {
                    let tmp = data[i-1]
                    data[i-1] = data[i]
                    data[i] = tmp
                }
            }
        }
    }
}
