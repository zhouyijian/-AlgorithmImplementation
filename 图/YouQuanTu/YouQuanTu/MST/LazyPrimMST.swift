//
//  LazyPrimMST.swift
//  YouQuanTu
//
//  Created by 周一见 on 2020/3/8.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

class LazyPrimMST<Weight: Comparable & Numeric> {
    private var dg: DenseGraph<Weight>
    ///横切边最小堆
    private var pq: MinHeap<Edge<Weight>>
    ///是否被遍历过
    private var marked: [Bool]
    ///最小生成树边的数组
    private var mst:[Edge<Weight>] = []
    
    init(g: DenseGraph<Weight>) {
        self.dg = g
        self.marked = Array.init(repeating: false, count: g.getNumber())
        self.pq = MinHeap<Edge<Weight>>.init(capacity: g.getNumber())
        
        visited(v: 0)
        while !pq.isEmpty() {
            let min = pq.extractMin()
            if marked[min.v()] == marked[min.w()] {
                continue
            }
            mst.append(min)
        }
    }
    
    private func visited(v: Int) {
        assert(marked[v], "重复遍历")
        marked[v] = true
        let adj = DenseGraph.adjTerrator.init(g: dg, v: v)
        var m = adj.begin()
        while !adj.end() {
            if let m0 = m, !marked[m0.other(x: v)] {
                pq.insert(value: m0)
            }
            m = adj.next()
        }
    }
    
    func getMST() -> [Edge<Weight>] {
        return mst
    }
    
}
