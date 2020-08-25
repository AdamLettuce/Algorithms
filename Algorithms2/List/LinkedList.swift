//
//  LinkedList.swift
//  Algorithms2
//
//  Created by Adam on 23/08/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//

import Foundation


class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

class LinkedList {
    var first: Node?
    var last: Node?
    var elementsCount: Int = 0
    
    func addFirst(value: Int) {
        let node = Node(value: value, next: nil)
        if isEmpty() {
            first = node
            last = first
        } else {
            node.next = first
            first = node
        }
        elementsCount += 1
    }
    
    func addLast(value: Int) {
        let node = Node(value: value, next: nil)
        if isEmpty() {
            first = node
            last = node
        } else {
            last?.next = node
            last = node
        }
        elementsCount += 1
    }
    
    func removeFirst() -> Int? {
        let result = first?.value
        let second = first?.next
        first?.next = nil
        first = second
        elementsCount -= 1
        return result
    }
    
    func removeLast() -> Int? {
        var result: Int?
        if first !== last {
            let previous = findPrevious(node: last!)
            result = last!.value
            last = previous
            previous!.next = nil
        } else {
            result = last?.value
            first = nil
            last = nil
        }
        elementsCount -= 1
        return result
    }
    
    func findPrevious(node: Node) -> Node? {
        var iterator = first
        while iterator?.next !== node {
            iterator = iterator!.next
        }
        return iterator
    }
    
    func contains(value: Int) -> Bool {
        return indexOf(value: value) != -1
    }
    
    func indexOf(value: Int) -> Int {
        var index = 0
        var iterator = first
        while iterator != nil {
            if iterator?.value == value {
                return index
            }
            iterator = iterator?.next
            index += 1
        }
        return -1
    }
    
    func size() -> Int {
        return elementsCount
    }
    
    func isEmpty() -> Bool {
       return first == nil
    }
    
    func printList() {
        if !isEmpty() {
            var iterator = first
            while iterator != nil {
                print("\(String(describing: iterator?.value))")
                iterator = iterator?.next
            }
        }
    }
}
