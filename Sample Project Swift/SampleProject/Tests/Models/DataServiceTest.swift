//
//  DataServiceTest.swift
//  SampleProject Swift
//
//  Created by Denis Svichkarev on 19/09/24.
//

import Foundation

func fetchDataFromMultipleSources() async {
    await withTaskGroup(of: String.self) { group in
        group.addTask {
            return await fetchData(from: "Source 1")
        }
        
        group.addTask {
            return await fetchData(from: "Source 2")
        }
        
        group.addTask {
            return await fetchData(from: "Source 3")
        }
        
        for await result in group {
            print("Received data: \(result)")
        }
        
        print("All tasks are complete!")
    }
}

func fetchData(from source: String) async -> String {
    // Simulate async request
    return "Data from \(source)"
}

func testStructuredConcurrency() {
    Task {
        await fetchDataFromMultipleSources()
    }
}
