//  Created by Adam on 12/05/2020.
import Foundation


class DynamicSizeStack<Item> {
    fileprivate var capacity: Int = 8
    var N: Int = 0
    var data: [Item?] = []
  
    init() {
        data = Array.init(repeating: nil, count: capacity)
    }
    
    init(_ initialCapacity: Int) {
        self.capacity = initialCapacity
        data = Array.init(repeating: nil, count: initialCapacity)
    }
    
    func push(element: Item) {
        if N >= capacity {
            var newData: [Item?] = Array.init(repeating: nil, count: capacity*2)
            for i in 0..<data.count {
                newData[i] = data[i]
            }
            data = newData
        }
        data[N] = element
        N += 1
    }
    
    func pop() -> Item? {
        if N <= data.count/4 {
            var newData: [Item?] = Array.init(repeating: nil, count: capacity/2)
            for i in 0..<newData.count {
                newData[i] = data[i]
            }
            data = newData
        }
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
