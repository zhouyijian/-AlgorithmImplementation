//
//  MinHeap.swift
//  MaxHeap
//
//  Created by 周一见 on 2020/3/10.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

struct MinIndexHeap<T: Comparable> {
    private var data: Array<T>
    private var count = 0
    private var indexs: Array<Int>
    
    init(capacity: Int) {
        data = Array<T>.init()
        indexs = Array<Int>.init()
        data.reserveCapacity(capacity)
        indexs.reserveCapacity(capacity)
    }
    
    init() {
        self.init(capacity: 10)
    }
    
    init(arr: Array<T>) {
        data = arr
        indexs = Array<Int>.init()
        for i in 0..<data.count {
            indexs.append(i)
        }
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
        indexs.append(count)
        count += 1
        shiftUp(index: count - 1)
    }
    
    mutating func extractMin() -> T {
        let min = data[indexs[0]]
        indexs[0] = indexs[count - 1]
        count -= 1
        shiftDwon(index: 0)
        return min
    }
    
    func getMixIndex() -> Int {
        assert(data.isEmpty)
        return indexs[0]
    }
    
    func getItem(index: Int) -> T {
        assert(data.isEmpty)
        return data[index]
    }
    
    mutating func changeIndex(index: Int, value: T) {
        data[index] = value
        for (index2, i) in indexs.enumerated() {
            if i == index {
                shiftUp(index: index2)
                shiftDwon(index: index2)
            }
        }
    }
    
    private mutating func shiftUp(index: Int) {
        var min = index
        while min > 0 && data[indexs[min]] < data[indexs[(min - 1) / 2]] {
            indexs.swapAt(min, (min - 1) / 2)
            min = (min - 1) / 2
        }
    }
    
    private mutating func shiftDwon(index: Int) {
        var max = index
        while (max * 2 + 1) < count {
            var j = max * 2 + 1
            if j + 1 < count && indexs[j + 1] < indexs[j] {
                j += 1
            }
            if indexs[j] < indexs[max] {
                indexs.swapAt(max, j)
                max = j
            } else {
                break
            }
        }
    }
        
}
