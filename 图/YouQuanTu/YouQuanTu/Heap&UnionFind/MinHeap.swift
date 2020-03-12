//
//  MinHeap.swift
//  MaxHeap
//
//  Created by 周一见 on 2020/3/10.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

struct MinHeap<T: Comparable> {
    private var data: Array<T>
    private var count = 0
    
    init(capacity: Int) {
        data = Array<T>.init()
        data.reserveCapacity(capacity)
    }
    
    init() {
        self.init(capacity: 10)
    }
    
    init(arr: Array<T>) {
        data = arr
        if data.count > 1 {
            for i in (0..<((data.count - 1) / 2)).reversed() {
                shiftDwon(index: i)
            }
        }
    }
    
    func size() -> Int {
        return count
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    mutating func insert(value: T) {
        data.append(value)
        count += 1
        shiftUp(index: count - 1)
    }
    
    mutating func extractMin() -> T {
        let min = data[0]
        data[0] = data[count - 1]
        count -= 1
        shiftDwon(index: 0)
        return min
    }
    
    private mutating func shiftUp(index: Int) {
        var min = index
        while min > 0 && data[min] < data[(min - 1) / 2] {
            data.swapAt(min, (min - 1) / 2)
            min = (min - 1) / 2
        }
    }
    
    private mutating func shiftDwon(index: Int) {
        var max = index
        while (max * 2 + 1) < count {
            var j = max * 2 + 1
            if j + 1 < count && data[j + 1] < data[j] {
                j += 1
            }
            if data[j] < data[max] {
                data.swapAt(max, j)
                max = j
            } else {
                break
            }
        }
    }
        
}
