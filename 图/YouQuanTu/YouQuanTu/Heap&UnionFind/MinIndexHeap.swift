//
//  MinHeap.swift
//  MaxHeap
//
//  Created by 周一见 on 2020/3/10.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

struct MinIndexHeap<T: Comparable> {
    private var data: Array<T?>
    private var count = 0
    private var indexs: Array<Int>
    private var reverses: Array<Int>
    
    init(capacity: Int) {
        data = Array<T?>.init(repeating: nil, count: capacity)
        indexs = Array<Int>.init()
        reverses = Array<Int>.init()
        data.reserveCapacity(capacity)
        indexs.reserveCapacity(capacity)
        reverses.reserveCapacity(capacity)
    }
    
    init() {
        self.init(capacity: 10)
    }
    
    init(arr: Array<T>) {
        data = arr
        indexs = Array<Int>.init()
        reverses = Array<Int>.init()
        for i in 0..<data.count {
            indexs.append(i)
            reverses.append(i)
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
    
    mutating func insert(index: Int, value: T) {
        data[index] = value
        indexs.append(count)
        reverses.append(count)
        count += 1
        shiftUp(index: count - 1)
    }
    
    mutating func extractMin() -> T {
        assert(isEmpty())
        let min = data[indexs[0]]!
        indexs[0] = indexs[count - 1]
        reverses[indexs[0]] = 0
        reverses[indexs[count - 1]] = -1
        count -= 1
        shiftDwon(index: 0)
        return min
    }
    
    func getMixIndex() -> Int {
        assert(data.isEmpty)
        return indexs[0]
    }
    
    func getItem(index: Int) -> T {
        assert(data.isEmpty || !contains(index: index))
        return data[index]!
    }
    
    func contains(index: Int) -> Bool {
        return reverses[index] != -1
    }
    
    mutating func changeIndex(index: Int, value: T) {
        assert(!contains(index: index))
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
        while min > 0 && data[indexs[min]]! < data[indexs[(min - 1) / 2]]! {
            indexs.swapAt(min, (min - 1) / 2)
            reverses[indexs[min]] = min
            reverses[indexs[(min - 1) / 2]] = (min - 1) / 2
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
                reverses[indexs[max]] = max
                reverses[indexs[j]] = j
                max = j
            } else {
                break
            }
        }
    }
        
}
