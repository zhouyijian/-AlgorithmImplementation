//
//  MaxHeap.swift
//  MaxHeap
//
//  Created by 周一见 on 2019/12/23.
//  Copyright © 2019 周一见. All rights reserved.
//

import Foundation

struct MaxIndexHeap<T: Comparable> {
    private var data: [T] = [] //数据真正存放的数组 从 0 开始
    private var count = 0 //数据的数量
    private var indexs: [Int] = [] //indexs 的索引，代表数据在二叉堆中的位置，indexs 的值代表数据在 data 中的索引
    private var reverses: [Int] = [] //reverses 的值代表 data 中相同索引的数据在二叉堆中的位置，即 indexs 的索引
    
    init(capacity: Int) {
        data.reserveCapacity(capacity)
    }
    
    init(array: [T]) {
        data = array
        count = data.count
        for i in 0..<count {
            indexs.append(i)
            reverses.append(i)
        }
        if count > 0 {
            var i = (count - 1) / 2
            while i >= 0 {
                var j = indexs[i]
                shiftDown(k: &j)
                i -= 1
            }
        }
    }
    
    func getCount() -> Int {
        return count
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    mutating func insert(element: T) {
        
        count += 1
        if self.data.count < count {
            self.data.append(element)
        } else {
            self.data[count - 1] = element
        }
        var index = count - 1
        indexs.append(index)
        reverses.append(index)
        shiftUp(index: &index)
        
    }
    
    private mutating func shiftUp(index: inout Int) {
        while index > 0  && data[indexs[index]] > data[indexs[(index - 1) / 2]]  {
            let parent = (index - 1) / 2
            indexs.swapAt(index, parent)
            reverses[indexs[index]] = index
            reverses[indexs[parent]] = parent
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
        let top = self.data[indexs[0]]
        indexs[0] = indexs.last!
        reverses[indexs.removeLast()] = -1
        count -= 1
        var k = 0
        shiftDown(k: &k)
        return top
    }
    
    private mutating func shiftDown(k: inout Int) {
        if count > 0 {
            while getLeftChild(index: k) < count {
                var i = getLeftChild(index: k)
                let j = getRightChild(index: k)
                
                if j < count && data[indexs[i]] < data[indexs[j]] {
                    i = j
                }
                if data[indexs[k]] >= data[indexs[i]] {
                    break
                }
                indexs.swapAt(k, i)
                reverses[indexs[k]] = k
                reverses[indexs[i]] = i
                k = i
            }
        }
    }
    
    mutating func removeTopIndex() -> Int {
        if count < 1 {
            fatalError("MaxHeap is empty")
        }
        let top = indexs[0]
        indexs[0] = indexs.last!
        reverses[indexs.removeLast()] = -1
        count -= 1
        var k = 0
        shiftDown(k: &k)
        return top
    }
    
    func getItem(index: Int) -> T {
        if !cotains(index: index) {
            fatalError("index no data in max heap")
        }
        return data[index]
    }
    
    mutating func change(index: Int, item: T) {
        if !cotains(index: index) {
            fatalError("index no data in max heap")
        }
        var k = reverses[index]
        data[index] = item
        shiftUp(index: &k)
        shiftDown(k: &k)
    }
    
    private func cotains(index: Int) -> Bool {
        if index < 0 || index >= count {
            fatalError("MaxHeap index out of range")
        }
        return reverses[index] != -1
    }
}
