//
//  main.swift
//  Algorithms2
//
//  Created by Adam on 08/04/2020.
//  Copyright © 2020 lettucesoftware. All rights reserved.
//

import Foundation
/*
var al = AdjacencyList()

var v1 = Vertex("v1")
var v2 = Vertex("v2")
var v3 = Vertex("v3")
var v4 = Vertex("v4")

al.addVertex(v: v1)
al.addVertex(v: v2)
al.addVertex(v: v3)
al.addVertex(v: v4)

v1.addAdjecent(vertex: v2)
v1.addAdjecent(vertex: v3)
v3.addAdjecent(vertex: v2)
v1.addAdjecent(vertex: v4)

al.BreadthFirstSearch(startVertex: v1)

print(al)
*/
/*
var bst = BinarySearchTree()
                                //                       10
bst.insert(key: 10,value: "10") //                      /  \
bst.insert(key: 5,value: "5")   //                     5    18
bst.insert(key: 18,value: "18") //                    /      \
bst.insert(key: 20,value: "20") //                   11      20
bst.insert(key: 11,value: "11") //                    \
bst.insert(key: 12,value: "12") //                     12
print(bst.floor(value: 19)!)
print(bst.ceiling(value: 19)!)
print(bst.findInRange(lo: 17,hi: 21))
print("\(String(describing: bst.select(k: 0)))")
print("\(String(describing: bst.select(k: 1)))")
print("\(String(describing: bst.select(k: 2)))")
print("\(String(describing: bst.select(k: 3)))")
print("\(String(describing: bst.select(k: 4)))")
print("\(String(describing: bst.select(k: 5)))")
print("----")
bst.printInorder()
print("----")
print("\(String(describing: bst.kThSmallest(k: 0)))")

print(bst.height())
*/

/*
let rbt = RedBlackBST<Int,String>()
rbt.put(key: 4, value: "4")
rbt.put(key: 1, value: "1")
rbt.put(key: 2, value: "2")
rbt.put(key: 3, value: "3")
rbt.put(key: 5, value: "5")
rbt.put(key: 7, value: "7")
rbt.put(key: 8, value: "8")
rbt.put(key: 9, value: "9")
rbt.printIfFound(key: 4)
rbt.printIfFound(key: 1)
rbt.printIfFound(key: 2)
rbt.printIfFound(key: 3)
rbt.printIfFound(key: 5)
rbt.printIfFound(key: 7)
rbt.printIfFound(key: 8)
rbt.printIfFound(key: 9)
rbt.printInorder()
print(try rbt.min())
print(try rbt.max())
rbt.deleteMin()
print(try rbt.min())
rbt.delete(5)
rbt.deleteMin()
rbt.deleteMin()
rbt.deleteMin()
rbt.deleteMin()
rbt.deleteMin()
rbt.deleteMin()
//rbt.deleteMin()
//rbt.deleteMin()
//rbt.deleteMin()
//rbt.deleteMin()
print("---")
rbt.printInorder()
rbt.put(key: 100, value: "100")
rbt.printInorder()
/*
print("----")
let bst = BinarySearchTree(root: nil)
bst.insert(key: 4, value: "4")
bst.insert(key: 1, value: "1")
bst.insert(key: 2, value: "2")
bst.insert(key: 3, value: "3")
bst.printPreorder()
rbt.printIfFound(key: 3)
rbt.printIfFound(key: 5)
if let foundMinimum = bst.min() {
    print("minimum: \(foundMinimum)")
} else {
    print("minimum not found")
}
if let foundMaximum = bst.max() {
    print("maximum: \(foundMaximum)")
} else {
    print("maximum not found")
}
//       4
//    1
//       2
//          3
*/
*/


//print(InsertionSortNonIncreasing().sort([1]))
//print(InsertionSortNonIncreasing().sort([1,2]))
//print(InsertionSortNonIncreasing().sort([2,1]))
//print(InsertionSortNonIncreasing().sort([1,2,3]))
//print(InsertionSortNonIncreasing().sort([3,2,1]))
//print(InsertionSortNonIncreasing().sort([4,2,3,2,1]))

//print(InsertionSort().sort([1]))
//print(InsertionSort().sort([1,2]))
//print(InsertionSort().sort([2,1]))
//print(InsertionSort().sort([1,2,3]))
//print(InsertionSort().sort([3,2,1]))
//print(InsertionSort().sort([4,2,3,2,1]))

//var a = [7,5,4,121,3,2,1]
//MergeSort().sort(A: &a)
//print(a)

//var a = [7,5,4,121,3,2,1]
//SelectionSort().sort(A: &a)
//print(a)


//var a: [Int] = [7,123,5,4,1,1123,3,2,1]
//ShellSort().sort(A: &a)
//print(a)


//var queue = QueueCyclicList<Int>()
////queue.toString()
//queue.enqueue(item: 1)
////queue.toString()
//queue.enqueue(item: 2)
////queue.toString()
//queue.enqueue(item: 3)
//queue.enqueue(item: 4)
//queue.toString()
//print("dq: \(String(describing: queue.dequeue()))")
//queue.toString()
//print("dq: \(String(describing: queue.dequeue()))")
//queue.toString()
//print("dq: \(String(describing: queue.dequeue()))")
//queue.toString()
//print("dq: \(String(describing: queue.dequeue()))")
//queue.toString()
//print("dq: \(String(describing: queue.dequeue()))")
//queue.toString()


let sll = SingleLinkedList<Int>()
sll.addBegin(4)
sll.addBegin(3)
sll.addBegin(4)
sll.addBegin(4)
sll.addBegin(4)
sll.addBegin(2)
sll.addBegin(4)
sll.addBegin(1)
sll.addBegin(4)
sll.addBegin(4)
sll.addBegin(4)
print(sll.findMaxRecursive()!)
print(sll.toString())
sll.revert()
print("---")
print(sll.toString())
sll.revert()
//sll.createCycleBetween(first: h3, second: h1)
sll.removeLast()
sll.removeLast()
sll.removeLast()
sll.removeLast()
sll.removeAt(index: 0)
sll.removeAt(index: 1)
sll.removeAt(index: 2)
sll.removeAt(index: 3)
sll.removeAt(index: 4)
print(sll.contains(key: 4))
print(sll.contains(key: 14))
sll.removeAfter(index: 0)
sll.removeAfter(index: 1)
sll.removeAfter(index: 2)
sll.removeAfter(index: 3)
sll.removeAfter(index: 4)
sll.removeAllWith(key: 4)
print(sll.findMaxRecursive()!)
print(sll.toString())

//var doubleLinkedList = DoubleLinkedList<Int>()
//doubleLinkedList.addBegin(1)
//doubleLinkedList.addBegin(2)
//doubleLinkedList.addBegin(3)
//doubleLinkedList.addEnd(4)
//doubleLinkedList.addEnd(5)
////doubleLinkedList.addBefore(index: 0, 10)
//doubleLinkedList.addAfter(index: 4, 10)
//doubleLinkedList.toString()
//print(doubleLinkedList.size())
//print("---")
////doubleLinkedList.addBefore(index: 3, 100)//TODO: start tomorrow
////print(doubleLinkedList.removeBegin())
////print(doubleLinkedList.removeBegin())
////print(doubleLinkedList.removeBegin())
////print(doubleLinkedList.removeBegin())
////print(doubleLinkedList.removeBegin())
////print(doubleLinkedList.removeBegin())
////print(doubleLinkedList.removeEnd())
////print(doubleLinkedList.removeEnd())
////print(doubleLinkedList.removeEnd())
////print(doubleLinkedList.removeEnd())
////print(doubleLinkedList.removeEnd())
////print(doubleLinkedList.removeEnd())
//print(doubleLinkedList.removeAt(index: 5))
//print("---")
//doubleLinkedList.toString()
//print(doubleLinkedList.size())

/*

let N = 10
let stack = Stack<Int>(capacity: N)
stack.toString()
for i in 1...N+1 {
    stack.push(element: i)
}
stack.toString()
print(stack.popAll())
stack.toString()

let stringStack = Stack<String>(capacity: 4)
stringStack.toString()
stringStack.push(element: "a")
stringStack.push(element: "d")
stringStack.push(element: "a")
stringStack.push(element: "m")
stringStack.toString()
print(stringStack.popAll())
*/

/*
let dss = DynamicSizeStack<Int>()
for i in 0...7 {
    dss.push(element: i)
}
dss.toString()
dss.push(element: 8)
dss.toString()

print(dss.popAll())
dss.toString()
print(dss.pop())
dss.toString()
print(dss.pop())
dss.toString()
*/

//let expressionToEvaluate = "( 2 * ( ( 1 + 2 ) * ( 2 + 2 ) ) )"
//let exp1 = Expression(expressionToEvaluate).evaluate()
//print("\(expressionToEvaluate) = \(exp1)")

//print(BinarySearch().find2(key: -1, A: [0,1,2,3]))
//print(BinarySearch().find2(key: 0, A: [0,1,2,3]))
//print(BinarySearch().find2(key: 1, A: [0,1,2,3]))
//print(BinarySearch().find2(key: 2, A: [0,1,2,3]))
//print(BinarySearch().find2(key: 3, A: [0,1,2,3]))
//print(BinarySearch().find2(key: 4, A: [0,1,2,3]))


//var A = [10,13,2]
//BubbleSort().sort(data: &A)
//print(A)

/*
var da = DynamicArray(size: 3)
da.insert(item: 10)
da.insert(item: 20)
da.insert(item: 30)
//da.insert(item: 40)
da.printArray()
print(da.indexOf(item: 410))
print(try da.removeAt(position: 2))
//print(try da.removeAt(position: 0))
//print(try da.removeAt(position: 0))
//print(try da.removeAt(position: 0))
print("After removal:")
da.printArray()
da.insert(item: 1)
da.printArray()
*/
