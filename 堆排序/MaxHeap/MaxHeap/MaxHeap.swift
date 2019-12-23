//
//  MaxHeap.swift
//  MaxHeap
//
//  Created by 周一见 on 2019/12/23.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

struct MaxHeap<T: Comparable> {
    private var data: [T] = []
    private var count = 0
    
    init(capacity: Int) {
        data.reserveCapacity(capacity)
    }
    
    func getCount() -> Int {
        return count
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    mutating func insert(element: T) {
        self.data.append(element)
        count += 1
        var index = count - 1
        shiftUp(index: &index)
        
    }
    
    private mutating func shiftUp(index: inout Int) {
        while index > 0  && data[index] > data[(index - 1) / 2]  {
            let parent = (index - 1) / 2
            data.swapAt(index, parent)
            index = parent
        }
    }
    
    private func getLeftChild(index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func getRightChild(index: Int) -> Int {
        return index * 2 + 2
    }
    
    mutating func removeTop() -> T {
        if count < 1 {
            fatalError("MaxHeap is empty")
        }
        let top = self.data[0]
        data[0] = data.last!
        data.removeLast()
        count -= 1
        shiftDown()
        return top
    }
    
    private mutating func shiftDown() {
        if count > 0 {
            var k = 0
            while getLeftChild(index: k) < count {
                var i = getLeftChild(index: k)
                let j = getRightChild(index: k)
                if j < count && data[i] < data[j] {
                    i = j
                }
                if data[k] >= data[i] {
                    break
                }
                data.swapAt(k, i)
                k = i
            }
        }
    }
}
