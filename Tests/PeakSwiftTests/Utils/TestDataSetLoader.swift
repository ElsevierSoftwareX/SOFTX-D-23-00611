//
//  File.swift
//  
//
//  Created by x on 26.05.23.
//

import Foundation
import PeakSwift

class TestDataSetLoader {
    
    let fileReader: FileReader = FileReader()
    let converter: Converter = JSONConverter()
    
    func getTestData(testDataSet: TestDataSet) throws -> QRSResult {
        let fileContent = try fileReader.readFile(fileName: testDataSet.rawValue, fileExtension: .json)
        let qrsResult = try converter.deserialize(toConvert: fileContent)
        return qrsResult
    }
}