//
//  SortHelper.swift
//  SelectionSort
//
//  Created by 周一见 on 2019/12/17.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

struct SortHelper {
    static func getArray(number: Int, left: Int, right: Int) -> [Int] {
        var array = Array<Int>.init()
        for _ in 0..<number {
            array.append(Int.random(in: left..<right))
        }
        return array
    }
    
    static func getNearSortArray(number: Int, swapNumber: Int) -> [Int] {
        var array = Array<Int>.init()
        for i in 0..<number {
            array.append(i)
        }
        for _ in 0..<swapNumber {
            array.swapAt(Int.random(in: 0..<number), Int.random(in: 0..<number))
        }
        return array
    }
    
    static func testSort<T: Comparable>(array: Array<T>) {
        for (i, _) in array.enumerated() {
            if i < array.count - 1 {
                if array[i] > array[i + 1] {
                    fatalError("Array not a sort")
                }
            }
        }
        print("Test sort success")
    }
    
    static func testTime<T: Comparable>(name: String, array: inout Array<T>, closure: ((inout Array<T>) -> Void)) {
        let startTime = Date().timeIntervalSince1970
        closure(&array)
        let endTime = Date().timeIntervalSince1970
        print("\(name) spend \(endTime - startTime)s sorted")
    }
}
