import Cocoa

// Step 1: Declare Variables for Personal Information

let firstName: String = "Zhalgas"
let lastName: String = "Bagytzhan"
let age: Int = 20
let birthYear: Int = 2005
let isStudent: Bool = true
let height: Double = 1.90
// Bonus Challenge
let currentYear: Int = age + birthYear

// Step 2: Create Variables for Your Hobbies and Interests

let hobbies: [String] = ["sport", "coding", "listen of music"]
let numberOfHobbies: Int = hobbies.count
let favouriteNumber: Int = 7
let isHobbyCreative: [Bool] = [true, false, true]

// Step 3: Create a Summary of Your Life Story

let lifeStory = """
"My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am currently \(isStudent ? "a student" : "not a student"). I enjoy \(isHobbyCreative[1] ? hobbies[1] : hobbies[0]), which is a creative hobby. I have \(numberOfHobbies) hobbies in total, and my favourite number is \(favouriteNumber)"
"""

// Step 4: Print Your Life Story

print(lifeStory)
