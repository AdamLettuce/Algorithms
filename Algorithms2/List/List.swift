//
//  List.swift
//  Algorithms2
//
//  Created by Adam on 06/10/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//

import Foundation

class Node<Item> {
    var data: Item
    var next: Node<Item>?
    
    init(_ data: Item) {
        self.data = data
    }
}

class List<Item: Comparable> {
    
    var head: Node<Item>? = nil
    var elementsCount: Int = 0
    
    init() {}
    
    init(value: Item) {
        head = Node(value)
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func insertBegin(_ value: Item) {
        let newNode = Node<Item>(value)
        if isEmpty() {
            head = newNode
            onInsertBeginIsEmpty()
        } else {
            newNode.next = head
            head = newNode
        }
        elementsCount += 1
    }
    
    func onInsertBeginIsEmpty() {
        //Template method, please implement me in the subclass
    }
    
    func insertEnd(_ value: Item) {
        let node = Node(value)
        if isEmpty() {
            head = node
            onInsertEndIsEmpty(node)
        } else {
            head?.next = node
            onInsertEndIsNotEmpty(node)
        }
        elementsCount += 1
    }
    
    func onInsertEndIsEmpty(_ node: Node<Item>) {
        //Template method, please implement me in the subclass
    }
    
    func onInsertEndIsNotEmpty(_ node: Node<Item>) {
        //Template method, please implement me in the subclass
    }
    
    func indexOf(value: Item) -> Int {
        var iterator = head
        var index = 0
        while iterator != nil {
            if iterator?.data == value {
                return index
            }
            iterator = iterator?.next
            index += 1
        }
        return -1
    }
    
    func contains(value: Item) -> Bool {
        return indexOf(value: value) != -1
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
    
    func findMin() -> Item? {
        var result = head?.data
        var iterator = head?.next
        while iterator != nil {
            if iterator!.data < result! {
                result = iterator!.data
            }
            iterator = iterator!.next
        }
        return result
    }
    
    func findMinRecursive() -> Item? {
        var result = head?.data
        if head?.next != nil {
            result = findMinRecursive(prevMin: result!, head: head!.next!)
        }
        return result
    }
    
    func findMinRecursive(prevMin: Item, head: Node<Item>) -> Item? {
        if head.data < prevMin {
            return head.data
        }
        return prevMin
    }
    
    func findPrevious(node: Node<Item>) -> Node<Item>? {
        var iterator = head
        while iterator?.next !== node {
            iterator = iterator!.next
        }
        return iterator
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
    
    func revert() {}
        
    func createCycleBetween(first: Node<Item>, second: Node<Item>) {
        second.next = first
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
    
    func size() -> Int {
        return elementsCount
    }
    
    func toArray() -> [Item] {
        var iterator = head
        var result: [Item] = []
        var index = 0
        while iterator != nil {
            result.append(iterator!.data)
            iterator = iterator!.next
            index += 1
        }
        return result
    }
    
    func toString() -> String {
        if isEmpty() {
            return "[]"
        }

        if hasCycle() {
            return "[cyclic list]"
        }
        
        var result = "["
        var iterator = head
        while(iterator != nil) {
            if iterator?.next != nil {
                result += "\(iterator!.data), "
            } else {
                result += "\(iterator!.data)]"
            }
            iterator = iterator!.next
        }
        return result
    }
    
}
