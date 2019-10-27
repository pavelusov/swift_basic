//Напишите собственный тип данных Очередь (Queue), подходящий для хранения любых типов

import Foundation

struct Queue<T> {
    private var items: [T] = []
    
    public var isEmpty: Bool {
        get {
            return items.isEmpty
        }
    }
    
    public var count: Int {
        get {
            return items.count
        }
    }
    
    public mutating func enqueue(_ element: T) {
        items.append(element)
    }
    
    public mutating func dequeued() -> T? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeFirst();
    }
    
    public func front() -> T? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.first
    }
}

var q1 = Queue<String>()

q1.enqueue("First")
q1.enqueue("Second")
q1.enqueue("Third")

print(q1.count)

if let front = q1.front() {
    print(front)
}

let str1 = q1.dequeued()
let str2 = q1.dequeued()
let str3 = q1.dequeued()
let str4 = q1.dequeued()

if let front = q1.front() {
    print(front)
}

print(q1.count)
