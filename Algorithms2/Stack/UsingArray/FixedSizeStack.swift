//  Created by Adam on 11/05/2020.
import Foundation


class FixedSizeStack<Item> {
    fileprivate var capacity: Int
    var N: Int = 0
    var data: [Item?] = []
    
    init(capacity: Int) {
        self.capacity = capacity
        self.data = Array.init(repeating: nil, count: capacity)
    }
    
    func push(element: Item) {
        if N < capacity {
            data[N] = element
            N += 1
        }
    }
    
    func pop() -> Item? {
        if !isEmpty() {
            N -= 1
            let result = data[N]
            data[N] = nil
            return result!
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        return N == 0
    }
    
    func popAll() -> [Item] {
        if isEmpty() {
            return []
        }
        var result:[Item] = []
        while(!isEmpty()) {
            result.append(pop()!)
        }
        return result
    }
    
    func toString() {
        print("n = \(N), \(data)")
    }
}
