//  Created by Adam on 13/04/2020.
import Foundation


class RedBlackTreeNode<Key: Comparable,Value> {

    var key: Key
    var value: Value?
    var left: RedBlackTreeNode?
    var right: RedBlackTreeNode?
    var color: Bool?
    var n: Int?
        
    init(key: Key, value: Value?, color: Bool, n: Int) {
        self.key = key
        self.value = value
        self.n = n
        self.color = color
    }
   
}
