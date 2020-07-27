//  Created by Adam on 27/06/2020.
import Foundation


class BinarySearchTreeNode {
    var left: BinarySearchTreeNode?
    var right: BinarySearchTreeNode?
    var key: Int
    var value: String
    var size: Int
    
    init(key: Int, value: String) {
        self.key = key
        self.value = value
        self.size = 1
    }
    
}

public class BinarySearchTree {
        
    var root: BinarySearchTreeNode?
        
    init() {}
    
    func insert(key: Int, value: String) {
         root = insert(x: root, key: key, value: value)
    }
    
    func insert(x: BinarySearchTreeNode?, key: Int, value: String) -> BinarySearchTreeNode? {
        if x == nil {
            return BinarySearchTreeNode(key: key, value: value)
        }
        if key > x!.key {
            x!.right = insert(x: x!.right, key: key, value: value)
        }
        else if key < x!.key {
            x!.left = insert(x: x!.left, key: key, value: value)
        } else {
            x!.value = value
        }
        x!.size = 1 + size(x: x!.left) + size(x: x!.right)
        return x
    }
    
    func get(node: BinarySearchTreeNode?, key: Int) -> String? {
        if node == nil {
            return nil
        }
        if node!.key == key {
            return node!.value
        }
        if key < node!.key {
            return get(node: node!.left, key: key)
        }
        if key > node!.key {
            return get(node: node!.right, key: key)
        }
        return nil
    }
    
    func min() -> String? {
        return min(node: root)
    }
    
    func min(node: BinarySearchTreeNode?) -> String? {
        if node?.left != nil {
            return min(node: node?.left)
        }
        return node?.value
    }
    
    func max() -> String? {
        return max(node: root)
    }
    
    func max(node: BinarySearchTreeNode?) -> String? {
        if node?.right != nil {
            return max(node: node?.right)
        }
        return node?.value
    }
    
    func printPreorder() {
        preorder(node: root)
    }
    
    func printInorder() {
        inorder(node: root)
    }
    
    func printPostorder() {
        postorder(node: root)
    }
    
    func preorder(node: BinarySearchTreeNode?) {
        if let existingNode = node {
            print("\(existingNode.value)")
            preorder(node: existingNode.left)
            preorder(node: existingNode.right)
        }
    }
    
    func inorder(node: BinarySearchTreeNode?) {
        if let existingNode = node {
            inorder(node: existingNode.left)
            print("\(existingNode.value)")
            inorder(node: existingNode.right)
        }
    }
    
    func postorder(node: BinarySearchTreeNode?) {
        if let existingNode = node {
            postorder(node: existingNode.left)
            postorder(node: existingNode.right)
            print("\(existingNode.value)")
        }
    }
    
    func floor(value: Int) -> String? {
        return floor(node: root, value: value)
    }
    
    func floor(node: BinarySearchTreeNode?, value: Int) -> String? {
        if node == nil {
            return nil
        }
        if value == node?.key {
            return node!.value
        }
        if value < node!.key {
            return floor(node: node?.left, value: value)
        }
        let right = floor(node: node?.right, value: value)
        if right != nil {
            return right
        }
        return node!.value
    }

    func ceiling(value: Int) -> String? {
        return ceiling(node: root, key: value)
    }
    
    func ceiling(node: BinarySearchTreeNode?, key: Int) -> String? {
        if node == nil {
            return nil
        }
        if node!.key == key {
            return node!.value
        }
        if node!.key < key {
            return ceiling(node: node?.right, key: key)
        }
        let x = ceiling(node: node?.left, key: key)
        if x == nil {
            return node?.value
        }
        return x
    }
    
    func findInRange(lo: Int, hi: Int) -> [Int] {
        var result: [Int] = []
        findInRange(node: root, lo: lo, hi: hi, result: &result)
        return result
    }
    
    func findInRange(node: BinarySearchTreeNode?, lo: Int, hi: Int, result: inout [Int]) {
        if node == nil {
            return
        }
        let aNode = node!
        if lo < aNode.key {
            findInRange(node: aNode.left, lo: lo, hi: hi, result: &result)
        }
        if lo <= aNode.key && aNode.key <= hi {
            result.append(aNode.key)
        }
        if hi > aNode.key {
            findInRange(node: aNode.right, lo: lo, hi: hi, result: &result)
        }
    }
    
    func select(k: Int) -> Int? {
        return select(x: root, k: k)
    }
    
    func select(x: BinarySearchTreeNode?, k: Int) -> Int? {
        if x == nil {
            return nil
        }
        let t = size(x: x?.left)
        if t > k {
            return select(x: x?.left, k: k)
        } else if t < k {
            return select(x: x?.right, k: k-t-1)
        } else {
            return x?.key
        }
    }
    
    func size(x: BinarySearchTreeNode?) -> Int {
        if x == nil {
            return 0
        }
        return x!.size
    }
    
    func kThSmallest(k: Int) -> Int {
        var result = 0
        var i = 0
        kThSmallest(node: root, k: k, i: &i, result: &result)
        return result
    }
    
    func kThSmallest(node: BinarySearchTreeNode?, k: Int, i: inout Int, result: inout Int) {
        if node == nil {
            return
        }
        kThSmallest(node: node!.left, k: k, i: &i, result: &result)
        i += 1
        if k == i-1 {
            result = node!.key
            return
        }
        kThSmallest(node: node!.right,k: k, i: &i, result: &result)
    }
    
    func height() -> Int {
        return height(node: root)
    }
    
    func height(node: BinarySearchTreeNode?) -> Int {
        if node == nil {
            return -1
        }
        return 1+Swift.max(height(node: node?.left), height(node: node?.right))
    }
    
}
