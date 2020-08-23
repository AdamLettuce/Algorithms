//  Created by Adam on 22/08/2020.
import Foundation


public class DynamicArray {
    
    private var index: Int = 0
    private var data: [Int]
    
    init(size: Int) throws {
        if size <= 0 {
            throw DynamicArrayError.WrongInitialSize
        }
        self.data = Array.init(repeating: 0, count: size)
    }
    
    func insert(item: Int) {
        if index == data.count {
            var newData = Array.init(repeating: 0, count: data.count*2)
            for i in 0 ..< index {
                newData[i] = data[i]
            }
            data = newData
        }
        data[index] = item
        index += 1
    }
    
    func removeAt(position: Int) throws -> Int {
        if position < 0 || position >= index {
            throw DynamicArrayError.IndexOutOfBounds
        }
        let result = data[position]
        for i in position ..< index-1 {
            data[i] = data[i+1]
        }
        index -= 1
        return result
     }
    
    func indexOf(item: Int) -> Int {
        for i in 0..<index {
            if data[i] == item {
                return i
            }
        }
        return -1
    }
    
    func contains(item: Int) -> Bool {
        for i in 0..<index {
            if data[i] == item {
                return true
            }
        }
        return false
    }
    
    func max() -> Int {
        var max = data[0]
        for i in 1 ..< index {
            if data[i] > max {
                max = data[i]
            }
        }
        return max
    }
    
    func intersect(second: DynamicArray) throws -> DynamicArray {
        if second.size() == 0 {
            return try DynamicArray(size: 1)
        }
        let result = try DynamicArray(size: 4)
        for i in 0 ..< index {
            if second.contains(item: data[i]) {
                result.insert(item: data[i])
            }
        }
        return result
    }
    
    func reverse() {
        if index <= 1 {
            return
        }
        for i in 0 ..< index/2 {
            let tmp = data[i]
            data[i] = data[index-i-1]
            data[index-i-1] = tmp
        }
    }
    
    func insert(at: Int, item: Int) throws {
        insert(item: item)
        for i in at ..< index-1 {
            data[i+1] = data[i]
        }
        data[at] = item
    }
    
    func get(at: Int) throws -> Int {
        if at >= 0 && at < index {
            return data[at]
        }
        throw DynamicArrayError.IndexOutOfBounds
    }
        
    func size() -> Int {
        return index
    }
    
    /*This method is defined here only for the testing purposes*/
    func printArray() {
        for i in 0..<index {
            print("\(data[i]) ")
        }
    }
        
    enum DynamicArrayError: Error {
        case IndexOutOfBounds
        case WrongInitialSize
    }
}
