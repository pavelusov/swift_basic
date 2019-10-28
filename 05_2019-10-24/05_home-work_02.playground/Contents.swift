// Напишите функцию для сложения любых двух числовых аргументов
// + extra String, Set, Array
import Foundation

protocol Summable {
    associatedtype Member
    static func +(a: Self, b: Self) -> Self
}

extension Int: Summable {
    typealias Member = Int
}

extension Float: Summable {
    typealias Member = Float
}

extension Double: Summable {
     typealias Member = Double
}

// Extra
extension String: Summable {
    typealias Member = String
    static func +(a: Member, b: Member) -> Member {
        return "\(a) \(b)"
    }
}

extension Set: Summable {
    typealias Member = Set
    static func +(a: Member, b: Member) -> Member {
        return a.union(b)
    }
}

extension Array: Summable {
    typealias Member = Element
}

func add<T: Summable>(_ a: T, _ b: T) -> T {
    return a + b
}

let intSum = add(1, 2)

let floatSum  = add(Float(1.0), Float(2.2))

let doubleSum = add(1.22, 2.34)

// Extra
let stringSum = add("Hello", "World")

let setSum = add(Set([1, 2, 3]), Set([2, 4, 7]))

let intArraySum = add([1, 3], [22, 3, 5])

let stringArraySum = add(["1", "A", "4"], ["22", "3", "4"])
