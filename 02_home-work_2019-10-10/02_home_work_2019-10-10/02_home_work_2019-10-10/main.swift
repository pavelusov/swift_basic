/*
 Работник работает по сменному графику 2/2. Дневная смена, ночная смена, выходной, выходной. Напишите программу, определяющую соответствие даты и смены работника.
 Пользователь должен ввести в консоли, какая смена была 1-го января, а затем может вводить месяц и день для получения результата.
 */

import Foundation

let NUMBERS_OF_MONTHS = 12

let months = [
    ("January", 31),
    ("February", 29),
    ("March", 31),
    ("April", 30),
    ("May", 31),
    ("June", 30),
    ("July", 31),
    ("August", 31),
    ("Semptember", 30),
    ("October", 31),
    ("November", 30),
    ("December", 31)
]

var workShedule: [String] = [
    "Day shift",
    "Night shift",
    "First day off",
    "Second day off"
]

func setWorkShedule(firstShift: Int = 0) -> [String] {
    let firstHalf = workShedule[..<firstShift]
    let secondHalf = workShedule[firstShift...]
    let shedule = secondHalf + firstHalf
    var nextShedule: [String] = []
    for shift in shedule {
        nextShedule.append(shift)
    }
    return nextShedule
}

func printWorkShedule() {
  print("1st = \(workShedule[0]), 2nd = \(workShedule[1]), 3rd = \(workShedule[2]), 4th = \(workShedule[3])")
}

print("A work shedule by default:")
printWorkShedule()

print("Input a shift number for 1 January: ")
if let inputShift = readLine() {
    let defaultShift = 1
    var inputNumber = inputShift == "" ? defaultShift : Int(inputShift) ?? defaultShift
    if inputNumber > workShedule.count || inputNumber < defaultShift {
        inputNumber = defaultShift
    }
    
    workShedule = setWorkShedule(firstShift: inputNumber - 1 )
}

print("The current work shedule:")
printWorkShedule()

/**
 *   [mohth: [day: shiftNumber]]
 **/
var year: [Int: [Int: Int]] = [:]
// go to months
for (numberMonth, (_,dayQuantity)) in months.enumerated() {
    var monthDays: [Int: Int] = [:]
    var shift = 0
    
    for day in 1...dayQuantity {
        monthDays[day] = shift
        shift =
            shift < workShedule.count - 1
                ? shift + 1
                : 0
    }
    
    year[numberMonth + 1] = monthDays
}

print("Input number of month of year => 1(January) - 12(December):")

var monthNumber = 1

if let inputMonthNumber = readLine() {
    monthNumber = Int(inputMonthNumber) ?? monthNumber
    if monthNumber > 12 {
        print("Only 12 months")
        monthNumber = 12
    }
    if monthNumber < 1 {
        print("there is no such month as a number")
        monthNumber = 1
    }
    
    print("The current number of month = \(monthNumber)")
}

print("Input number of a working day: ")

var defaultDayNumber = 1
var dayNumber = defaultDayNumber

if let inputDay = readLine() {
    dayNumber = Int(inputDay) ?? defaultDayNumber
    if dayNumber < defaultDayNumber {
        dayNumber = defaultDayNumber
    }
    if dayNumber > year[monthNumber]!.count {
        dayNumber = year[monthNumber]!.count
    }
    print("The number of day: \(dayNumber)")
}

if let shiftNumber = year[monthNumber]![dayNumber] {
    print(workShedule[shiftNumber])
}
