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
