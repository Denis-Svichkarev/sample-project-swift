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
        
        testResultType()
        
        // Opaque Types (some)
        // Existential Any
        // Primary Associated Types
        // Variadic Parameters
        // Objective-C Style Selectors
        // @autoclosure для assert и других проверок
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
        
        /// Leads to crash
        /// print(pet.owner.firstName)
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
}
