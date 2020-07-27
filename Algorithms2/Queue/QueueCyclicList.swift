//  Created by Adam on 16/05/2020.
import Foundation


class QueueCyclicList<Item: Comparable> {
    class Node<Item> {
        var data: Item?
        var next: Node<Item>?
        
        init(data: Item?) {
            self.data = data
        }
    }
    
    var last: Node<Item>?
    
    func enqueue(item: Item) {
        if last == nil {
            last = Node(data: item)
            last!.next = last!
        } else {
            let newNode = Node(data: item)
            let tmp = last!.next
            last!.next = newNode
            newNode.next = tmp
            last = newNode
        }
    }
    
    func dequeue() -> Item? {
        if isEmpty() {
            return nil
        }
        let first = last!.next!
        let result = first.data
        if first === last {
            last!.next = nil
            last = nil
        } else {
            last!.next = first.next
            first.next = nil
        }
        return result
    }
    
    func toString() {
        if isEmpty() {
            print("empty")
            return
        }
        var iterator = last!.next
        repeat {
            print(String(describing: iterator!.data))
            iterator = iterator!.next
        } while iterator !== last!.next
    }
    
    func isEmpty() -> Bool {
        return last == nil
    }
}
