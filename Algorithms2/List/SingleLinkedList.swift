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
    
    func removeAt(index: Int) {
        if isEmpty() {
            return
        }
        if index == 0 {
            head = head!.next
            return
        }
        var counter = 0
        var iterator = head
        while counter < index - 1 {
            iterator = iterator?.next
            counter += 1
        }

        let nodeToRemove = iterator?.next
        iterator?.next = iterator?.next?.next
        nodeToRemove?.next = nil
                
        elementsCount -= 1
    }
    
    func removeAfter(index: Int) {
        removeAt(index: index + 1)
    }
    
    /* Brute-force solution
     func removeAllWithOn3(key: Item) {
         while contains(key: key) {
             var iterator = head
             var counter = 0
             while iterator != nil {
                 if iterator!.data == key {
                     removeAt(index: counter)
                     counter -= 1
                 }
                 counter += 1
                 iterator = iterator!.next
             }
         }
     }
     */
    
    func removeAllWith(key: Item) {
        if isEmpty() {
            return
        }

        while head?.data == key {
            let headNext = head!.next
            head!.next = nil
            elementsCount -= 1
            head = headNext
        }
        
        var a = head
        var b = head?.next
        while b != nil {
            if b!.data == key {
                a!.next = b!.next
                b!.next = nil
                elementsCount -= 1
                b = a!.next
            } else {
                a = a!.next
                b = a!.next
            }
        }
    }
        
    func findPrevious(node: Node<Int>) -> Node<Int>? {
        //TODO: please implement me
        return nil
    }
                        
    func findMax() -> Item? {
        if isEmpty() { return nil }
        var iterator = head!.next
        var max = head!.data
        
        while iterator != nil {
            if iterator!.data > max {
                max = iterator!.data
            }
            iterator = iterator!.next
        }
        return max
    }
    
    func findMaxRecursive() -> Item? {
        if isEmpty() { return nil }
        return findMaxRecursive(prevMax: head!.data, head: head!.next)
    }
    
    func findMaxRecursive(prevMax: Item, head: Node<Item>?) -> Item {
        if head != nil && head!.data > prevMax {
            return findMaxRecursive(prevMax: head!.data, head: head!.next)
        }
        if head != nil && head!.data <= prevMax {
            return findMaxRecursive(prevMax: prevMax, head: head!.next)
        }
        return prevMax
    }
    
    func findMin() -> Int? {
        //TODO: please implement me
        return nil
    }
    
    func findMinRecursive() -> Int? {
        //TODO: please implement me
        return nil
    }
    
    func findMinRecursive(prevMax: Int, head: Node<Int>?) -> Int {
        //TODO: please implement me
        return 0
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
