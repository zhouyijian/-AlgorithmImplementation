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
    
    ///路径压缩，子节点指向父亲的父亲
    mutating func find(_ p: Int) -> Int {
        parentUnion[p] = parentUnion[parentUnion[p]]
        return parentUnion[p]
    }
    
    mutating func isConnected(_ p: Int, _ q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    mutating func unionElements(_ p: Int, q: Int) {
        let pRoot = find(p)
        let qRoot = find(q)
        if pRoot != qRoot {
            if rank[pRoot] < rank[qRoot] {
                parentUnion[pRoot] = parentUnion[qRoot]
            } else if rank[pRoot] > rank[qRoot]{
                parentUnion[qRoot] = parentUnion[pRoot]
            } else {
                parentUnion[pRoot] = parentUnion[qRoot]
                rank[pRoot] += 1
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
    
    ///路径压缩，所有节点直接指向根节点
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
        let pRoot = find(p)
        let qRoot = find(q)
        if pRoot != qRoot {
            if rank[pRoot] < rank[qRoot] {
                parentUnion[pRoot] = parentUnion[qRoot]
            } else if rank[pRoot] > rank[qRoot]{
                parentUnion[qRoot] = parentUnion[pRoot]
            } else {
                parentUnion[pRoot] = parentUnion[qRoot]
                rank[pRoot] += 1
            }
        }
    }
    
}
