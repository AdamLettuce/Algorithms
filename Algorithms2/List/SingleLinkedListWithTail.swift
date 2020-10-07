//
//  LinkedList.swift
//  Algorithms2
//
//  Created by Adam on 23/08/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//

import Foundation


class SingleLinkedListWithTail: List<Int> {
    
    var tail: Node<Int>?
    
    func insertBegin(value: Int) {
        let newNode = Node(value)
        if isEmpty() {
            head = newNode
            tail = head
        } else {
            newNode.next = head
            head = newNode
        }
        elementsCount += 1
    }
    
    func insertEnd(value: Int) {
        let node = Node(value)
        if isEmpty() {
            head = node
            tail = node
        } else {
            head?.next = node
            tail = node
        }
        elementsCount += 1
    }
    
    func removeBegin() -> Int? {
        let result = head?.data
        let second = head?.next
        head?.next = nil
        head = second
        elementsCount -= 1
        return result
    }
    
    func removeEnd() -> Int? {
        var result: Int?
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
    
    func removeAt(index: Int) {
        //TODO: please implement me
    }
    
    func removeAfter(index: Int) {
        //TODO: please implement me
    }
    
    func removeAllWith(key: Int) {
        //TODO: please implement me
    }
    
    func findPrevious(node: Node<Int>) -> Node<Int>? {
        var iterator = head
        while iterator?.next !== node {
            iterator = iterator!.next
        }
        return iterator
    }
    
    func findMax() -> Int? {
        //TODO: please implement me
        return nil
    }
    
    func findMaxRecursive() -> Int? {
        //TODO: please implement me
        return nil
    }
    
    func findMaxRecursive(prevMax: Int, head: Node<Int>?) -> Int {
        //TODO: please implement me
        return 0
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
        var a = head
        var b = a?.next
        var c: Node<Int>? = nil
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
