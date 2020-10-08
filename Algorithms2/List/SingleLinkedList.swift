//  Created by Adam on 12/05/2020.
import Foundation


class SingleLinkedList<Item: Comparable>: List<Item> {

    func insertBegin(_ value: Item) {
        let newNode = Node<Item>(value)
        if isEmpty() {
            head = newNode
        } else {
            newNode.next = head
            head = newNode
        }
        elementsCount += 1
    }
    
    func insertEnd(value: Item) {
        let node = Node<Item>(value)
        if isEmpty() {
            head = node
        } else {
            head?.next = node
        }
        elementsCount += 1
    }
    
    func removeBegin() -> Item? {
        if isEmpty() {
            return nil
        }
        
        let oldHead = head
        let result = head!.data
        head = head!.next
        oldHead!.next = nil
        
        elementsCount -= 1
        
        return result
    }
    
    func removeEnd() {
        if isEmpty() {
            return
        }
        var it1 = head
        var it2 = head!.next
        
        if it2 == nil {
            head = nil
            return
        }
        
        while it2?.next != nil {
            it1 = it1?.next
            it2 = it2?.next
        }
        it1!.next = nil
        
        elementsCount -= 1
    }
                                        
    override func revert() {
        if isEmpty() {
            return
        }
        var a = head
        var b = head!.next
        var c: Node<Item>? = nil
        a?.next = c
        while b != nil {
            c = b?.next
            b?.next = a
            a = b
            b = c
        }
        head = a
    }
    
}
