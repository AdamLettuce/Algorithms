//  Created by Adam on 23/08/2020.
import Foundation


class SingleLinkedListWithTail<Item: Comparable & Hashable>: SingleLinkedList<Item> {
    
    var tail: Node<Item>?
    
    override func removeBegin() -> Item? {
        if head == nil {
            return nil
        }
        
        if head === tail {
            let tmp = head
            head = nil
            tail = nil
            return tmp!.data
        }
        
        let tmp = head
        head = head!.next
        tmp!.next = nil
        return tmp!.data
    }

    override func removeEnd() -> Item? {
        var result: Item?
        if head !== tail {
            let previous = findPrevious(node: tail!)
            result = tail!.data
            tail = previous
            previous!.next = nil
            elementsCount -= 1
        } else {
            result = tail?.data
            head = nil
            tail = nil
            elementsCount -= 1
        }
        return result
    }
    
    override func onInsertBeginIsEmpty() {
        tail = head
    }
    
    override func onInsertEndIsEmpty(_ node: Node<Item>) {
        tail = node
    }

    override func onInsertEndIsNotEmpty(_ node: Node<Item>) {
        tail = node
    }
                
    override func onRevertEnd() {
        tail = head
//        last?.next = nil ??? please visualize why this is necessary ???
    }

}
