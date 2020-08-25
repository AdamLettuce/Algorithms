//  Created by Adam on 12/05/2020.
import Foundation

/*
 Single linked list without pointer to the last node.
 */
class SingleLinkedList<Item: Comparable> {
    
    class Node<Item> {
        var data: Item
        var next: Node<Item>?
        
        init(_ data: Item) {
            self.data = data
        }
    }
    
    var head: Node<Item>?
    
    init() {}
    
    init(value: Item) {
        head = Node(value)
    }
    
    func addBegin(_ value: Item) -> Node<Item> {
        if head == nil {
            head = Node(value)
        } else {
            let newNode = Node<Item>(value)
            newNode.next = head
            head = newNode
        }
        return head!
    }
    
    func hasCycle() -> Bool {
        var it1 = head
        var it2 = head?.next?.next

        while it1 != nil && it2 != nil {
            if it1 === it2 {
                return true
            }
            it1 = it1!.next
            it2 = it2!.next?.next
        }
        return false
    }
    
    func createCycleBetween(first: Node<Item>, second: Node<Item>) {
        second.next = first
    }
        
    func removeLast() {
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
    }
    
    func isEmpty() -> Bool {
        return head == nil
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
                
    }
    
    func removeAfter(index: Int) {
        removeAt(index: index + 1)
    }
    
    func removeAllWith(key: Item) {
        if isEmpty() {
            return
        }

        while head?.data == key {
            let headNext = head!.next
            head!.next = nil
            head = headNext
        }
        
        var a = head
        var b = head?.next
        while b != nil {
            if b!.data == key {
                a!.next = b!.next
                b!.next = nil
                b = a!.next
            } else {
                a = a!.next
                b = a!.next
            }
        }
    }
    
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
    
    func indexOf(key: Item) -> Int {
        var iterator = head
        var index = 0
        while iterator != nil {
            if iterator!.data == key {
                return index
            }
            iterator = iterator?.next
            index += 1
        }
        return -1
    }
    
    func contains(key: Item) -> Bool {
        return indexOf(key: key) != -1
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
    
    func revert() {
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
    
    func toString() -> String {
        if isEmpty() {
            return "[]"
        }

        if hasCycle() {
            return "[cyclic list]"
        }
        
        var result = ""
        var iterator = head
        while(iterator != nil) {
            result += "\(iterator!.data), "
            iterator = iterator!.next
        }
        return result
    }
    
}
