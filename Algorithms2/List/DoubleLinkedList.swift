//  Created by Adam on 18/05/2020.
import Foundation


class DoubleLinkedList<Item: Comparable> {
    
    class Node<Item> {
        var data: Item
        var next: Node<Item>?
        var prev: Node<Item>?
        
        init(_ data: Item) {
            self.data = data
        }
    }
    
    var head: Node<Item>?
    var tail: Node<Item>?
    var n: Int = 0
    
    func addBegin(_ data: Item) {
        let newNode = Node(data)
        if isEmpty() {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head!.prev = newNode
            head = newNode
        }
        n += 1
    }
    
    func addBefore(index: Int, _ data: Item) {
        if isEmpty() || 0 > index || index >= n {
            return
        }
        if index == 0 {
            addBegin(data)
        } else {
            let newNode = Node(data)
            var i = 0
            var iterator = head
            while i < index {
                iterator = iterator?.next
                i += 1
            }
            
            newNode.next = iterator
            newNode.prev = iterator!.prev
            iterator!.prev?.next = newNode
            iterator!.prev = newNode
            n += 1
        }
    }
    
    func addAfter(index: Int, _ data: Item) {
        if isEmpty() || 0 > index || index >= n {
            return
        }
        if index == n-1 {
            addEnd(data)
        } else {
            let newNode = Node(data)
            var i = 0
            var iterator = head
            while i < index {
                iterator = iterator?.next
                i += 1
            }
            
            newNode.prev = iterator
            newNode.next = iterator!.next
            iterator!.next?.prev = newNode
            iterator!.next = newNode
            n += 1
        }
    }
    
    func addEnd(_ data: Item) {
        let newNode = Node(data)
        if isEmpty() {
            head = newNode
            tail = newNode
        } else {
            tail!.next = newNode
            newNode.prev = tail
            tail = newNode
        }
        n += 1
    }
    
    func removeBegin() -> Item? {
        if isEmpty() {
            return nil
        }
        let result = head!.data
        if head === tail {
            head!.next = nil
            tail!.prev = nil
            head = nil
            tail = nil
        } else {
            head!.next!.prev = nil
            head = head!.next
        }
        n -= 1
        return result
    }
    
    func removeEnd() -> Item? {
        if isEmpty() {
            return nil
        }
        let result = tail!.data
        if head === tail {
            head!.next = nil
            tail!.prev = nil
            head = nil
            tail = nil
        } else {
            tail!.prev!.next = nil
            tail = tail!.prev
        }
        n -= 1
        return result
    }
    
    func removeAt(index: Int) -> Item? {
        if isEmpty() || 0 > index || index >= n {
            return nil
        }
        var i = 0
        var iterator = head
        while i < index {
            iterator = iterator?.next
            i += 1
        }
        let result = iterator!.data
        iterator!.prev?.next = iterator!.next
        iterator!.next?.prev = iterator!.prev
        iterator?.next = nil
        iterator?.prev = nil
        n -= 1
        return result
    }
    
    func isEmpty() -> Bool {
        return head === tail && head == nil
    }
    
    func size() -> Int {
        return n
    }
    
    func toString() {
        if isEmpty() {
            print("empty list")
        } else {
            var iterator = head
            while iterator != nil {
                print(String(describing: iterator?.data))
                iterator = iterator!.next
            }
        }
    }
    
    
}
