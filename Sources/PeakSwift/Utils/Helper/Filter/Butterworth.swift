//
//  File.swift
//  
//
//  Created by x on 27.06.23.
//

import Foundation
import Butterworth

public class Butterworth {
    
    public enum Order: Int {
        case one = 1
        case two
        case three
        case four
        case five
        // ButterworthWrapper is internally restricted to only order 5 filtering
        // Can be increased if necessary in the ButterworthWrapper.mm implementation
    }
    
    private let butterworthWrapper = ButterworthWrapper()
    
    public init() {
        
    }
    
    
    /// This butterworth filter applies the a BandPassFilter once forward on a signal
    /// - Parameters:
    ///   - signal: the signal to filter
    ///   - order: The order of the butterworth filter, currently the filter 1-5 is supported
    ///   - lowCutFrequency: the cutoff frequenvy, every freqeuncy should be filtered below the cutoff frequency
    ///   - highCutFrequency: the cutoff frequenvy, every freqeuncy should be filtered above the cutoff frequency
    ///   - sampleRate: the sampling rate of signal
    /// - Returns: Filtered signal with frequency in range between lowCutFrequency and highCutFrequency
    public func butterworth(signal: [Double], order: Order, lowCutFrequency: Double, highCutFrequency: Double, sampleRate: Double) -> [Double] {
        let signalObjC : [NSNumber] = signal as [NSNumber]
        let lowCutObjC = NSNumber(value: lowCutFrequency)
        let highCutObjC = NSNumber(value: highCutFrequency)
        let sampleRateObjC = NSNumber(value: sampleRate)
        let orderObjC = NSNumber(value: order.rawValue)
        
        let filteredSignal = butterworthWrapper.butterworth(signalObjC, orderObjC, sampleRateObjC, lowCutObjC, highCutObjC)
        
        return filteredSignal as! [Double]
    }
    
    
    
    /// This butterworth filter applies the a HighPassFilter once forward and afterwards backwards
    /// - Parameters:
    ///   - signal: The signal to filter
    ///   - order: The order of the butterworth filter, currently the filter 1-5 is supported
    ///   - lowCutFrequency: the cutoff frequenvy, every freqeuncy should be filtered below the cutoff frequency
    ///   - sampleRate: the sampling rate of signal
    /// - Returns: The filter signal without frequencies below the lowCutFrequency
    public func butterworthForwardBackward(signal: [Double], order: Order, lowCutFrequency: Double, sampleRate: Double) -> [Double] {
        let signalObjC : [NSNumber] = signal as [NSNumber]
        let lowCutObjC = NSNumber(value: lowCutFrequency)
        let sampleRateObjC = NSNumber(value: sampleRate)
        let orderObjC = NSNumber(value: order.rawValue)
        
        let filteredSignal = butterworthWrapper.butterworthHighPassForwardBackward(signalObjC, orderObjC, sampleRateObjC, lowCutObjC)
        
        return filteredSignal as! [Double]
        
    }
}