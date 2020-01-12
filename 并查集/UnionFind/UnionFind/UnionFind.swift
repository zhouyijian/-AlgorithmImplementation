//
//  UnionFind.swift
//  UnionFind
//
//  Created by 周一见 on 2020/1/12.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

struct UnionFind {
    private var parentUnion: Array<Int>
    private var rank: Array<Int>
    private var count: Int
    
    init(count: Int) {
        self.parentUnion = Array.init(repeating: 0, count: count)
        self.rank = Array.init(repeating: 1, count: count)
        for i in 0..<count {
            self.parentUnion[i] = i
        }
        self.count = count
    }
    
    mutating func find(_ p: Int) -> Int {
        parentUnion[p] = parentUnion[parentUnion[p]]
        return parentUnion[p]
    }
    
    mutating func isConnected(_ p: Int, _ q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    mutating func unionElements(_ p: Int, q: Int) {
        if find(p) != find(q) {
            if rank[p] < rank[q] {
                parentUnion[p] = parentUnion[q]
            } else if rank[p] > rank[q]{
                parentUnion[q] = parentUnion[p]
            } else {
                parentUnion[p] = parentUnion[q]
                rank[p] += 1
            }
        }
    }
    
}

struct UnionFind2 {
    private var parentUnion: Array<Int>
    private var rank: Array<Int>
    private var count: Int
    
    init(count: Int) {
        self.parentUnion = Array.init(repeating: 0, count: count)
        self.rank = Array.init(repeating: 1, count: count)
        for i in 0..<count {
            self.parentUnion[i] = i
        }
        self.count = count
    }
    
    mutating func find(_ p:Int) -> Int {
        if p != parentUnion[p] {
            parentUnion[p] = find(parentUnion[p])
        }
        return parentUnion[p]
    }
    
    mutating func isConnected(_ p: Int, _ q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    mutating func unionElements(_ p: Int, q: Int) {
        if find(p) != find(q) {
            if rank[p] < rank[q] {
                parentUnion[p] = parentUnion[q]
            } else if rank[p] > rank[q]{
                parentUnion[q] = parentUnion[p]
            } else {
                parentUnion[p] = parentUnion[q]
                rank[p] += 1
            }
        }
    }
    
}
