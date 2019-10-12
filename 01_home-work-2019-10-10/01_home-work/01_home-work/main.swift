/*
 Напишите консольную программу, которая принимает от пользователя два параметра: букву, число.
 Вывести в консоль список всех фамилий, начинающихся на данную букву, если их владелец имеет пол, соответствующий введённому числу. Источником является массив, подготовленный заранее.
 */

import Foundation

let letter: String
var gender = 0
var message: String?
let peopleList: [Int: [String]] = [
    0: [
        "Leanne Graham",
        "Patricia Lebsack",
        "Glenna Reichert",
        "Clementina DuBuque"
    ],
    1: [
        "Ervin Howell",
        "Dennis Schulist",
        "Nicholas Runolfsdottir",
        "Kurtis Weissnat"
    ],
]

func getFirstLetter(word: String) -> String {
    return String(word[word.startIndex])
}

print("Enter the letter with which the name begins:")

if let firstLine = readLine() {
    if firstLine != "" {
        letter = getFirstLetter(word: firstLine).uppercased()
        
        if let _ = Int(String(letter)) {
            print("a number cannot be a letter")
            exit(0)
        }
        
        print("Input number of gender: 0 - woman, 1 - man (by default - 0)")
        
        if let secondLine: String = readLine() {
            
            if secondLine != "" {
                let tempChar = getFirstLetter(word: secondLine)
                gender = (Int(String(tempChar)) ?? 0) >= 1 ? 1 : 0
            }
        }
        
        let genderList = peopleList[gender]!
        
        for user in genderList {
            if user.hasPrefix(letter) {
                message = user
            }
        }
    } else {
        print("Emptiness cannot be a letter")
        exit(0)
    }
}

if message != nil {
    print(message!)
} else {
    print("There is not person in our list")
}
