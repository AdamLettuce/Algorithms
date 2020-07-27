//  Created by Adam on 27/06/2020.
import Foundation


class AdjacencyList: CustomStringConvertible {
    var vertices: [Vertex]
    
    init() {
        vertices = []
    }
    
    func addVertex(v: Vertex) {
        vertices.append(v)
    }
    
    public var description: String {
        return "Adjecency list:\n" + vertices.filter {$0.getAdjecentVertices().count > 0}
            .map {$0.description}
            .joined(separator: "\n")
    }
    
    func BreadthFirstSearch(startVertex: Vertex) {
        var state: [Vertex:VertexState] = [:]
        vertices.filter {$0.label != startVertex.label}
            .forEach {
                state[$0] = VertexState.undiscovered
        }
        state[startVertex] = VertexState.discovered
        let queue = QueueCyclicList<Vertex>()
        queue.enqueue(item: startVertex)
        while !queue.isEmpty() {
            if let u = queue.dequeue() {                
                for v in u.getAdjecentVertices() {
                    if state[v] == VertexState.undiscovered {
                        state[v] = VertexState.discovered
                        queue.enqueue(item: v)
                    }
                }
                state[u] = VertexState.processed
            }            
        }
    }
}

class Vertex: CustomStringConvertible, Hashable, Comparable {
    static func < (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.label < rhs.label
    }
    
    
    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.label == rhs.label
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(self.label)
    }
    
    let label: String
    private var adjecentVertices: [Vertex]
    
    init(_ label: String) {
        self.label = label
        self.adjecentVertices = []
    }
    
    func addAdjecent(vertex: Vertex) {
        adjecentVertices.append(vertex)
    }
    
    func getAdjecentVertices() -> [Vertex] {
        return self.adjecentVertices
    }
    
    public var description: String {
        return label + ": " + adjecentVertices.map {$0.label}.joined(separator: ",")
    }
}

enum VertexState {
    case undiscovered
    case discovered
    case processed
}
