//  Created by Adam on 23/08/2020.
import XCTest

class DynamicArrayUnitTests: XCTestCase {
    
    func sizeToSmall_throwsException() throws {
        var instance: DynamicArray? = nil
        do {
            try instance = DynamicArray(size: 0)
        } catch DynamicArray.DynamicArrayError.WrongInitialSize {
        }
        XCTAssertNil(instance)
    }
        
    func test_insertOneElement() throws {
        let instance = try DynamicArray(size: 1)
        instance.insert(item: 10)
        XCTAssertEqual(1, instance.size())
    }
    
    func test_insertTwoElementsToArrayWithSizeOne() throws {
        let instance = try DynamicArray(size: 1)
        instance.insert(item: 10)
        instance.insert(item: 20)
        XCTAssertEqual(2, instance.size())
    }
    
    func test_getFirstElement() throws {
        let instance = try DynamicArray(size: 1)
        instance.insert(item: 10)
        XCTAssertEqual(10, try instance.get(at: 0))
    }
    
    func test_getElementAtSecondPosition() throws {
        let instance = try DynamicArray(size: 2)
        instance.insert(item: 10)
        instance.insert(item: 20)
        XCTAssertEqual(20, try instance.get(at: 1))
    }
    
    func test_removeFromEmpty() throws {
        let instance = try DynamicArray(size: 1)
        var exceptionThrown = false
        do {
           try _ = instance.removeAt(position: 0)
        } catch DynamicArray.DynamicArrayError.IndexOutOfBounds {
            exceptionThrown = true
        }
        XCTAssertTrue(exceptionThrown)
    }
    
    func test_removeFirstFromArrayWithOneElement() throws {
        let instance = try DynamicArray(size: 1)
        instance.insert(item: 10)
        let result = try instance.removeAt(position: 0)
        XCTAssertEqual(result, 10)
    }
    
    func test_removeFirstFromArrayWithOneElementEmpty() throws {
        let instance = try DynamicArray(size: 1)
        instance.insert(item: 10)
        let _ = try instance.removeAt(position: 0)
        XCTAssertEqual(0, instance.size())
    }
    
    func test_removeSecondFromArrayWithTwoElements() throws {
        let instance = try DynamicArray(size: 2)
        instance.insert(item: 10)
        instance.insert(item: 20)
        let result = try instance.removeAt(position: 1)
        XCTAssertEqual(result, 20)
    }
    
    func test_indexOfEmptyArray() throws {
        let instance = try DynamicArray(size: 1)
        let result = instance.indexOf(item: 10)
        XCTAssertEqual(-1, result)
    }
    
    func test_indexOfArrayWithOneElement() throws {
        let instance = try DynamicArray(size: 1)
        instance.insert(item: 10)
        let result = instance.indexOf(item: 10)
        XCTAssertEqual(0, result)
    }
    
    func test_indexOfArrayWithTwoElements() throws {
        let instance = try DynamicArray(size: 2)
        instance.insert(item: 10)
        instance.insert(item: 20)
        let result = instance.indexOf(item: 20)
        XCTAssertEqual(1, result)
    }
    
    func test_containsArrayWithTwoElements() throws {
        let instance = try DynamicArray(size: 2)
        instance.insert(item: 10)
        instance.insert(item: 20)
        XCTAssertTrue(instance.contains(item: 10))
        XCTAssertTrue(instance.contains(item: 20))
    }
    
    func test_max() throws {
        let instance = try DynamicArray(size: 3)
        instance.insert(item: 1)
        instance.insert(item: 3)
        instance.insert(item: 2)
        XCTAssertEqual(3, instance.max())
    }
    
    func test_intersectTwoArraysSizeOneNoCommonElements() throws {
        let instanceOne = try DynamicArray(size: 1)
        instanceOne.insert(item: 1)
        
        let instanceTwo = try DynamicArray(size: 1)
        instanceTwo.insert(item: 2)
        
        let result = try instanceOne.intersect(second: instanceTwo)
        XCTAssertEqual(0, result.size())
    }
    
    func test_intersectTwoArraysSizeOneCommonElements() throws {
        let instanceOne = try DynamicArray(size: 1)
        instanceOne.insert(item: 1)
        
        let instanceTwo = try DynamicArray(size: 1)
        instanceTwo.insert(item: 1)
        
        let result = try instanceOne.intersect(second: instanceTwo)
        XCTAssertEqual(1, result.size())
        XCTAssertTrue(result.contains(item: 1))
    }
    
    func test_intersectTwoArraysOneSizeOneSecondSizeTwoOneCommonElement() throws {
        let instanceOne = try DynamicArray(size: 1)
        instanceOne.insert(item: 1)
        
        let instanceTwo = try DynamicArray(size: 1)
        instanceTwo.insert(item: 1)
        instanceTwo.insert(item: 2)
        
        let result = try instanceOne.intersect(second: instanceTwo)
        XCTAssertEqual(1, result.size())
        XCTAssertTrue(result.contains(item: 1))
    }
    
    func test_intersectTwoArraysSizeThreeTwoCommonElements() throws {
        let instanceOne = try DynamicArray(size: 3)
        instanceOne.insert(item: 1)
        instanceOne.insert(item: 3)
        instanceOne.insert(item: 2)
        
        let instanceTwo = try DynamicArray(size: 3)
        instanceTwo.insert(item: 4)
        instanceTwo.insert(item: 3)
        instanceTwo.insert(item: 2)
        
        let result = try instanceOne.intersect(second: instanceTwo)
        XCTAssertEqual(2, result.size())
        XCTAssertTrue(result.contains(item: 3))
        XCTAssertTrue(result.contains(item: 2))
    }
    
    func test_reverse() throws {
        let instance = try DynamicArray(size: 4)
        instance.insert(item: 1)
        instance.insert(item: 2)
        instance.insert(item: 3)
        instance.insert(item: 4)
        
        instance.reverse()
        
        XCTAssertEqual(4, try instance.get(at: 0))
        XCTAssertEqual(3, try instance.get(at: 1))
        XCTAssertEqual(2, try instance.get(at: 2))
        XCTAssertEqual(1, try instance.get(at: 3))
    }
    
    func test_insertAt() throws {
        let instance = try DynamicArray(size: 1)
        try instance.insert(at: 0, item: 2)
        XCTAssertEqual(1, instance.size())
        XCTAssertEqual(2, try instance.get(at: 0))
    }
    
    func test_insertAt0() throws {
        let instance = try DynamicArray(size: 2)
        instance.insert(item: 1)
        try instance.insert(at: 0, item: 2)
        XCTAssertEqual(2, instance.size())
        XCTAssertEqual(2, try instance.get(at: 0))
    }
    
    func test_insertAt1() throws {
        let instance = try DynamicArray(size: 1)
        instance.insert(item: 1)
        try instance.insert(at: 0, item: 2)
        XCTAssertEqual(2, instance.size())
        XCTAssertEqual(2, try instance.get(at: 0))
    }
}
