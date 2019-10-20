import Foundation

class Person {
    private let firstName: String
    private let lastName: String
    private let patronymic: String
    private var age: Int
    var passport: Passport?
    var fullName: String {
        get {
            return "\(lastName) \(firstName) \(patronymic)"
        }
    }
    
    init(firstName: String, lastName: String, patronymic: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.patronymic = patronymic
        self.age = age
        print("Person init")
    }
    
    deinit {
        print("Person deinit")
    }
}

class Passport {
    let series: Int
    let number: Int
    var issueDate: String
    weak var person: Person?
    
    init(series: Int, number: Int, issueDate: String) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        print("Passport init")
    }
    
    deinit {
        print("Passport deinit")
    }
}

var person1: Person?
var passport1: Passport?

person1 = Person(firstName: "Pavel", lastName: "Usov", patronymic: "Nikolaevich", age: 36)
passport1 = Passport(series: 2356, number: 123456, issueDate: "2010-10-10")

person1!.passport = passport1
person1!.passport!.person = person1


person1 = nil
passport1 = nil
