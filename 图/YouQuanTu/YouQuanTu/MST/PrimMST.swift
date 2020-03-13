//
//  PrimMST.swift
//  YouQuanTu
//
//  Created by 周一见 on 2020/3/12.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

class PrimMST<Weight: Comparable & Numeric> {
    private var dg: DenseGraph<Weight>
    ///横切边最小索引堆
    private var pq: MinIndexHeap<Edge<Weight>>
    ///是否被遍历过
    private var marked: [Bool]
    ///最小生成树边的数组
    private var mst:[Edge<Weight>] = []
    
    init(g: DenseGraph<Weight>) {
        self.dg = g
        self.marked = Array.init(repeating: false, count: g.getNumber())
        self.pq = MinIndexHeap<Edge<Weight>>.init(capacity: g.getNumber())
        visited(v: 0)
        while !pq.isEmpty() {
            let v = pq.getMixIndex()
            let min = pq.extractMin()
            if marked[min.v()] == marked[min.w()] {
                continue
            }
            mst.append(min)
            visited(v: v)
        }
    }
    
    private func visited(v: Int) {
        assert(marked[v], "重复遍历")
        marked[v] = true
        let adj = DenseGraph.adjTerrator.init(g: dg, v: v)
        var m = adj.begin()
        while !adj.end() {
            if let m0 = m, !marked[m0.other(x: v)] {
                if pq.contains(index: v) {
                    if pq.getItem(index: v) > m0 {
                        pq.changeIndex(index: v, value: m0)
                    }
                } else {
                    pq.insert(index: v, value: m0)
                }
            }
            m = adj.next()
        }
    }
    
    func getMST() -> [Edge<Weight>] {
        return mst
    }
    
}
