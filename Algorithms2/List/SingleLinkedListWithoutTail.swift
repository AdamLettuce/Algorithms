//  Created by Adam on 12/05/2020.
import Foundation


class SingleLinkedListWithoutTail<Item: Comparable>: SingleLinkedList<Item> {
        
    override func removeEnd() -> Item? {
        if isEmpty() {
            return nil
        }
        var it1 = head
        var it2 = head!.next
        
        if it2 == nil {
            let result = head!.data
            head = nil
            return result
        }
        
        while it2?.next != nil {
            it1 = it1?.next
            it2 = it2?.next
        }
        let result = it2!.data
        it1!.next = nil
        
        elementsCount -= 1
        return result
    }
    
    override func removeAt(index: Int) -> Item? {
        if index <= 0 {
            return removeBegin()
        }
        if index >= elementsCount {
            return removeEnd()
        }
        
        let previousNode = nodeAt(index-1)
        let nodeToRemove = previousNode?.next
        previousNode?.next = nodeToRemove?.next
        
        elementsCount -= 1
        
        
        return nodeToRemove?.data
    }
    
    override func insertEnd(_ value: Item) {
        let newNode = Node(value)
        if isEmpty() {
            head = newNode
        } else {
            var iterator = head
            while iterator!.next !== nil {
                iterator = iterator!.next
            }
            iterator!.next = newNode
        }
        elementsCount += 1
    }
    
    override func removeFirstWith(key: Item) -> Item? {
        if isEmpty() { return nil }
        
        if head!.data == key {
            return removeBegin()
        }
        
        var iterator = head
        while iterator!.next != nil && iterator!.next?.data != key {
            iterator = iterator!.next
        }
        
        let tmp = iterator!.next
        iterator!.next = tmp?.next
        tmp?.next = nil
        
        elementsCount -= 1
        
        return tmp?.data
    }
    
    override func revert() {
        var a = head
        var b = head?.next
        var c = head?.next?.next
        
        while b != nil {
            b?.next = a
            a?.next = nil
            a = b
            b = c
            c = c?.next
        }
        
        head = a
    }

    //Another solution - my own
    override func hasCycle() -> Bool {
        var a = head
        var b = head?.next?.next

        while a !== b && b != nil {
            a = a!.next
            b = b!.next?.next
        }

        return a != nil && a === b
    }
}
