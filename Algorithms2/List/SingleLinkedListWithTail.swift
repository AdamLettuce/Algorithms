//  Created by Adam on 23/08/2020.
import Foundation


class SingleLinkedListWithTail<Item: Comparable>: SingleLinkedList<Item> {
    
    var tail: Node<Item>?

    func removeEnd() -> Item? {
        var result: Item?
        if head !== tail {
            let previous = findPrevious(node: tail!)
            result = tail!.data
            tail = previous
            previous!.next = nil
            elementsCount -= 1
        } else {
            result = tail?.data
            head = nil
            tail = nil
            elementsCount -= 1
        }
        return result
    }
    
    override func onInsertBeginIsEmpty() {
        tail = head
    }
    
    override func onInsertEndIsEmpty(_ node: Node<Item>) {
        tail = node
    }

    override func onInsertEndIsNotEmpty(_ node: Node<Item>) {
        tail = node
    }
                
    override func onRevertEnd() {
        tail = head
//        last?.next = nil ??? please visualize why this is necessary ???
    }

}
