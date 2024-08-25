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
}
