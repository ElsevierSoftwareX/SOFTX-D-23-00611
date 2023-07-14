//
//  File.swift
//  
//
//  Created by Nikita Charushnikov on 06.07.23.
//

import XCTest
@testable import PeakSwift


final class MathUtilsTests: XCTestCase {
    
    func testDiff() {
        let actualResult = MathUtils.diff([1, 2, 4, 7, 0])
        let exptectedResult: [Double] = [ 1,  2,  3, -7]
        
        XCTAssertEqual(actualResult, exptectedResult)
    }
    
    func testGradient() {
        let inputVector = [5, 9 , 9.5, 10, 30, 5, 3]
        
        let actualGradient = MathUtils.gradient(inputVector)
        let expectedGradient =  [4, 2.25 ,  0.5,   10.25,  -2.5,  -13.5,   -2 ]
        
        XCTAssertEqual(actualGradient, expectedGradient)
    }
}