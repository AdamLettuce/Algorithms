//  Created by Adam on 12/05/2020.
import Foundation


class SingleLinkedListWithoutTail<Item: Comparable>: SingleLinkedList<Item> {
        
    func removeEnd() -> Item? {
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

}
