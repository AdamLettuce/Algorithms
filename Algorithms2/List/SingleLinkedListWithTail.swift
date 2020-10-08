//  Created by Adam on 23/08/2020.
import Foundation


class SingleLinkedListWithTail<Item: Comparable>: List<Item> {
    
    var tail: Node<Item>?
    
    override func onInsertBeginIsEmpty() {
        tail = head
    }
    
    override func onInsertEndIsEmpty(_ node: Node<Item>) {
        tail = node
    }

    override func onInsertEndIsNotEmpty(_ node: Node<Item>) {
        tail = node
    }
    
    func removeBegin() -> Item? {
        let result = head?.data
        let second = head?.next
        head?.next = nil
        head = second
        elementsCount -= 1
        return result
    }
    
    func removeEnd() -> Item? {
        var result: Item?
        if head !== tail {
            let previous = findPrevious(node: tail!)
            result = tail!.data
            tail = previous
            previous!.next = nil
        } else {
            result = tail?.data
            head = nil
            tail = nil
        }
        elementsCount -= 1
        return result
    }
        
    override func revert() {
        var a = head
        var b = a?.next
        var c: Node<Item>? = nil
        a?.next = c
        
        while b != nil {
            c = b!.next
            b!.next = a
            a = b
            b = c
        }
        
        tail = head
//        last?.next = nil ??? please visualize why this is necessary ???
        head = a
    }
    
}
