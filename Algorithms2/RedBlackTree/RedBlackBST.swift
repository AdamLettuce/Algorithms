//  Created by Adam on 15/04/2020.
import Foundation


class RedBlackBST<Key: Comparable,Value> {
    var root: RedBlackTreeNode<Key,Value>?
    
    let RED = true
    let BLACK = false
    
    func isRed(_ x: RedBlackTreeNode<Key,Value>?) -> Bool {
        return x?.color == RED
    }
    
    func size(_ x: RedBlackTreeNode<Key,Value>?) -> Int {
        return x?.n ?? 0
    }
    
    func size() -> Int {
        return size(root)
    }
    
    func isEmpty() -> Bool {
        return root == nil
    }
    
    func rotateLeft(_ h: RedBlackTreeNode<Key,Value>?) -> RedBlackTreeNode<Key,Value>? {
        let x = h?.right
        h?.right = x?.left
        x?.left = h
        x?.color = h?.color
        h?.color = RED
        x?.n = h?.n
        h?.n = 1 + size(h?.left) + size(h?.right)
        return x
    }
    
    func rotateRight(_ h: RedBlackTreeNode<Key,Value>?) -> RedBlackTreeNode<Key,Value>? {
        let x = h?.left
        h?.left = x?.right
        x?.right = h
        x?.color = h?.color
        h?.color = RED
        x?.n = h?.n
        h?.n = 1 + size(h?.left) + size(h?.right)
        return x
    }
    
    func flipColors(_ node: RedBlackTreeNode<Key,Value>) {
        node.color = RED
        node.left?.color = BLACK
        node.right?.color = BLACK
    }
        
    func get(key: Key) -> Value? {
        return get(node: root,key: key)
    }
    
    func get(node: RedBlackTreeNode<Key,Value>?, key: Key) -> Value? {
        if node == nil {
            return nil
        }
        if key > node!.key {
            return get(node: node!.right, key: key)
        }
        if key < node!.key {
            return get(node: node!.left, key: key)
        }
        return node!.value
    }
    
    func contains(key: Key) -> Bool {
        return get(key: key) != nil
    }
    
    func put(key: Key, value: Value) {
        root = put(h: &root, key: key, value: value)
        root?.color = BLACK
    }
    
    func put(h: inout RedBlackTreeNode<Key,Value>?, key: Key, value: Value) -> RedBlackTreeNode<Key,Value>? {
        if h == nil {
            return RedBlackTreeNode(key: key, value: value, color: RED, n: 1)
        }
        
        if key < h!.key {
            h!.left = put(h: &h!.left, key: key, value: value)
        } else if key > h!.key {
            h!.right = put(h: &h!.right, key: key, value: value)
        } else {
            h!.value = value
        }
        
        if isRed(h!.right) && !isRed(h!.left) {
            h = rotateLeft(h)
        }
        
        if isRed(h!.left) && isRed(h!.left?.left) {
            h = rotateRight(h)
        }
        
        if isRed(h!.left) && isRed(h!.right) {
            flipColors(h!)
        }
        
        h!.n = size(h!.left) + size(h!.right) + 1
        return h
    }
    
    //Red-black tree deletion
    func deleteMin() {
        if isEmpty() {
            return//or throw exception?
        }
        
        if !isRed(root!.left) && !isRed(root!.right) {
            root!.color = RED
        }
        
        root = deleteMin(&root)
        
        if !isEmpty() {
            root!.color = BLACK
        }
    }
    
    func deleteMin(_ h: inout RedBlackTreeNode<Key,Value>?) -> RedBlackTreeNode<Key,Value>? {
        if h?.left == nil {
            return nil
        }
        
        if !isRed(h?.left) && !isRed(h?.left?.left) {
            h = moveRedLeft(&h!)
        }
        
        h!.left = deleteMin(&h!.left)
        return balance(&h)
    }
    
    func delete(_ key: Key) {
        if !contains(key: key) { return }

        // if both children of root are black, set root to red
        if !isRed(root?.left) && !isRed(root?.right) {
            root?.color = RED;
        }

        root = delete(&root, key)
        if !isEmpty() {
            root!.color = BLACK
        }
    }

    // delete the key-value pair with the given key rooted at h
    func delete(_ h: inout RedBlackTreeNode<Key,Value>?, _ key: Key?) -> RedBlackTreeNode<Key,Value>? {
        // assert get(h, key) != null;

        if (key != nil && h != nil && key! < h!.key)  {
            if !isRed(h!.left) && !isRed(h!.left?.left) {
                h = moveRedLeft(&h!)
            }
            h!.left = delete(&h!.left, key)
        }
        else {
            if isRed(h?.left) {
                h = rotateRight(h)
            }
            if key != nil && key != nil && key == h!.key && h!.right == nil {
                return nil
            }
            if !isRed(h?.right) && !isRed(h?.right?.left) {
                h = moveRedRight(&h!)
            }
            if key != nil && h != nil && key! == h!.key {
                let x = min(h!.right)
                h!.key = x!.key
                h!.value = x!.value
                h!.right = deleteMin(&h!.right)
            }
            else {
                h!.right = delete(&h!.right, key)
            }
        }
        return balance(&h)
    }
    
    func moveRedLeft(_ h: inout RedBlackTreeNode<Key,Value>) -> RedBlackTreeNode<Key,Value>? {
        flipColors(h)
        if (isRed(h.right?.left)) {
            h.right = rotateRight(h.right);
            h = rotateLeft(h)!
            flipColors(h)
        }
        return h
    }
    
    func moveRedRight(_ h: inout RedBlackTreeNode<Key,Value>) -> RedBlackTreeNode<Key,Value>? {
        flipColors(h)
        if (isRed(h.left?.left)) {
            h.right = rotateRight(h)
            flipColors(h)
        }
        return h
    }
    
    func balance(_ h: inout RedBlackTreeNode<Key,Value>?) -> RedBlackTreeNode<Key,Value>? {
        if isRed(h!.right) {
            h = rotateLeft(h)!
        }
        if isRed(h!.left) && isRed(h!.left?.left) {
            h = rotateRight(h)
        }
        if isRed(h!.left) && isRed(h!.right) {
            flipColors(h!)
        }
            
        h!.n = size(h!.left) + size(h!.right) + 1
        return h
    }

    func height() -> Int {
        return height(root)
    }
    
    func height(_ x: RedBlackTreeNode<Key,Value>?) -> Int {
        if x == nil {
            return -1
        }
        return 1 + Swift.max(height(x?.left),height(x?.right))
    }
    
    func min() throws -> Key {
        if isEmpty() {
            throw RedBlackBSTError.EmptyTree
        }
        return min(root)!.key
    }
    
    func min(_ x: RedBlackTreeNode<Key,Value>?) -> RedBlackTreeNode<Key,Value>? {
        if x?.left == nil {
            return x
        }
        return min(x!.left)
    }
    
    func max() throws -> Key {
        if isEmpty() {
            throw RedBlackBSTError.EmptyTree
        }
        return max(root)!.key
    }
    
    func max(_ x: RedBlackTreeNode<Key,Value>?) -> RedBlackTreeNode<Key,Value>? {
        if x?.right == nil {
            return x
        }
        return max(x!.right)
    }
    
    func check() -> Bool {
        if !isBST() {
            print("Not in symmetric order")
        }
        if !isSizeConsistent() {
            print("Subtree counts not consistent")
        }
        if !isBalanced() {
            print("Not balanced")
        }
        return isBST()
            && isSizeConsistent()
            && isBalanced()
    }

    func isBST() -> Bool {
        return isBST(root, nil, nil);
    }

    func isBST(_ x: RedBlackTreeNode<Key,Value>?, _ min: Key?, _ max: Key?) -> Bool {
        if x == nil {
            return true
        }
        if min != nil && x!.key <= min! {
            return false
        }
        if max != nil && x!.key >= max! {
            return false
        }
        return isBST(x?.left, min, x?.key) && isBST(x?.right, x?.key, max)
    }

    func isSizeConsistent() -> Bool {
        return isSizeConsistent(root)
    }
    
    func isSizeConsistent(_ x: RedBlackTreeNode<Key,Value>?) -> Bool {
        if x == nil {
          return true
        }
        if x!.n != size(x!.left) + size(x!.right) + 1 {
            return false
        }
        return isSizeConsistent(x?.left) && isSizeConsistent(x?.right)
    }

    func isBalanced() -> Bool {
        var black: Int = 0
        var x = root
        while (x != nil) {
            if !isRed(x) {
                black += 1
            }
            x = x!.left;
        }
        return isBalanced(root, &black);
    }

    func isBalanced(_ x: RedBlackTreeNode<Key,Value>?, _ black: inout Int) -> Bool {
        if x == nil {
          return black == 0
        }
        if !isRed(x) {
            black -= 1
        }
        return isBalanced(x!.left, &black) && isBalanced(x!.right, &black);
    }

    
    enum RedBlackBSTError: Error {
        case EmptyTree
    }
    
    func printInorder() {
        inorder(node: root)
    }
    
    func inorder(node: RedBlackTreeNode<Key,Value>?) {
        if let existingNode = node {
            inorder(node: existingNode.left)
            print("\(String(describing: existingNode.value)), tree node count = \(size(existingNode))")
            inorder(node: existingNode.right)
        }
    }
    
    func printIfFound(key: Key) {
        if let found = get(key: key) {
            print("found value = \(found), for key = \(key)")
        } else {
            print("did not find vlaue for key = \(key)")
        }
    }
}
