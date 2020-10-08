//  Created by Adam on 12/05/2020.
import Foundation


class SingleLinkedList<Item: Comparable>: List<Item> {
        
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

}
