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

let workShedule: [String] = [
    "0 Day shift",
    "1 Night shift",
    "2 First day off",
    "3 Second day off"
]

/**
 * getDaysByShedule
 **/
func getDaysByShedule(sheduleNumber n: Int = 0) -> ArraySlice<String> {
    guard n == 0 || n < workShedule.count else { return workShedule[0...] }
    return workShedule[n...]
}

func getMonth(dayQuantity: Int, shiftDay: Int) -> [Int: Int] {
    var monthMap: [Int: Int] = [:]
    
    let firstWorkingDays = getDaysByShedule(sheduleNumber: shiftDay)
    
    // create January  month - first days
    for (i, name) in firstWorkingDays.enumerated() {
        monthMap[i + 1] = workShedule.firstIndex(of: name)
    }
    
    // create January month - other days
    for day in stride(from: firstWorkingDays.count + 1, to: 31, by: workShedule.count) {
        for (i, _) in workShedule.enumerated() {
            monthMap[day + i] = i
        }
    }

    return monthMap
}


let janMonth = getMonth(dayQuantity: 31, shiftDay: 2)
