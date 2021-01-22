//
//  BlueToothPrjTests.swift
//  BlueToothPrjTests
//
//  Created by EricM on 12/3/20.
//

import XCTest
@testable import BlueToothPrj

class BlueToothPrjTests: XCTestCase {
    
    func testSavedData(){
        var testWeight = [SavedWeightData]()
            do{
                try testWeight = SaveWeight.saveManager.getWeight()
            }catch{
                fatalError()//.localizedDescription
            }
        XCTAssertTrue(testWeight.count >= 1, "There is saved weight data")
//        XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
    }
    
    func testJsonData(){
        var jsonData = [Weighted]()
            guard let pathToJSONFile =
                    Bundle.main.path(forResource: "JsonTestData", ofType: "json") else {fatalError("couldn't Find json file")}
            let url = URL(fileURLWithPath: pathToJSONFile)
            do{
                let data = try Data(contentsOf: url)
                jsonData = try WeightData.getWeights(from: data).weight
            } catch{
                fatalError("couldn't get weight from JSON")
            }
        XCTAssert(jsonData.count >= 1, "There is data from json")
    }
    
    func testChart(){
        
    }
    
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
