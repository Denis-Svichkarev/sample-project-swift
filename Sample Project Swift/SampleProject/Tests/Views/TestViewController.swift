//
//  TestViewController.swift
//  SampleProject Swift
//
//  Created by Denis Svichkarev on 24.08.2024.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testCompactMaps()
    }
    
    func testInitializers() {
        /// Example of using classes
        let myObject = MyClass(name: "James")
        let myObject2 = myObject
        myObject2.name = "Paul"
        
        myObject.test()
        myObject2.test()
        
        /// Example of using structures
        let myStruct = MyStruct(name: "John")
        var myStruct2 = myStruct
        myStruct2.changeName()
        
        myStruct.test()
        myStruct2.test()
        
        /// Copy-on-write example
        var array1 = [1, 2, 3]
        let array2 = array1
        array1.append(4)
        
        print(array1)
        print(array2)
    }
    
    func testGettersAndSetters() {
        let person = Person(firstName: "John", lastName: "Smith", age: 20)
        person.age = 30
        person.greet()
        
        print(person.fullName)
    }
    
    func testObjectReferences() {
        var person: Person? = Person(firstName: "John", lastName: "Smith", age: 20)
        let pet = Animal(name: "Charlie", owner: person!)
        person?.pet = pet
        person = nil
        
        // Leads to crash
        // print(pet.owner.firstName)
    }
    
    func testMaps() {
        let numbers = [1, 2, 3, 4, 5]
        let squaredNumbers = numbers.map { $0 * 2 }

        print(squaredNumbers)
        
        let number: Int? = 5
        let result = number.map { $0 * 2 }

        print(result ?? "nil")
    }
    
    func testFlatMaps() {
        let array = [[1, 2, 3], [4, 5, 6]]
        let flatArray = array.flatMap { $0 }

        print(flatArray)
        
        let number: Int? = 5
        let result = number.flatMap { Optional($0 * 2) }

        // With flatMap the result is Optional(10), not Optional(Optional(10))
        print(result ?? "nil")
    }
    
    func testCompactMaps() {
        let numbers = ["1", "2", "three", "4"]
        let validNumbers = numbers.compactMap { Int($0) }
        print(validNumbers)
    }
    
    func testVariadicParameters() {
        logMessages("Server started", "User logged in", "Error 404")
        
        print(sumOfNumbers(1, 2, 3, 4, 5))
        print(sumOfNumbers(10, 20))
    }
    
    func logMessages(_ messages: String...) {
        for message in messages {
            print("Log: \(message)")
        }
    }
    
    func sumOfNumbers(_ numbers: Int...) -> Int {
        var total = 0
        for number in numbers {
            total += number
        }
        return total
    }
    
    func testReduce() {
        let numbers = [1, 2, 3, 4, 5]
        let sum = numbers.reduce(0) { (total, number) in
            total + number
        }
        print(sum)
        
        let strings = ["Hello", " ", "World", "!"]
        let result = strings.reduce("") { (currentString, nextString) in
            currentString + nextString
        }
        print(result)
        
        let numbers2 = [3, 5, 1, 8, 2]
        let maxNumber = numbers2.reduce(numbers2[0]) { (currentMax, number) in
            return max(currentMax, number)
        }
        print(maxNumber)
    }
    
    func testSelectors() {
        // Old style
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        // New style
        let button2 = UIButton()
        button2.addAction(UIAction { _ in
            print("Button tapped")
        }, for: .touchUpInside)
        
        // @autoclosure example
        logIfNeeded(5 > 3, message: "Condition is true")
    }
    
    @objc func buttonTapped() {
        print("Button tapped")
    }
    
    func logIfNeeded(_ condition: @autoclosure () -> Bool, message: String) {
        if condition() {
            print(message)
        }
    }
    
    func testFilter() {
        let numbers = [1, 6, 3, 8, 4]
        let filteredNumbers = numbers.filter { $0 > 5 }  // Result: [6, 8]
        print(filteredNumbers)
        
        struct User {
            let name: String
            let age: Int
        }

        let users = [
            User(name: "John", age: 30),
            User(name: "Jane", age: 25),
            User(name: "Tom", age: 20)
        ]

        let filteredUsers = users.filter { $0.age >= 25 }
        print(filteredUsers)
    }
}
