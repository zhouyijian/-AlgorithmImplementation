//
//  LazyPrimMST.swift
//  YouQuanTu
//
//  Created by 周一见 on 2020/3/8.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

class LazyPrimMST<Weight: Comparable> {
    private var dg: DenseGraph<Weight>
    ///横切边数组（一般用最小堆实现）
    private var pq: Array<Edge<Weight>> = []
    ///是否被遍历过
    private var marked: [Bool]
    ///最小生成树边的数组
    private var mst:[Edge<Weight>] = []
    
    init(g: DenseGraph<Weight>) {
        self.dg = g
        self.marked = Array.init(repeating: false, count: g.getNumber())
        
        visited(v: 0)
        while !pq.isEmpty {
            var minIndex = 0
            for i in 1..<pq.count {
                if pq[i] < pq[minIndex] {
                    minIndex = i
                }
            }
            let edge = pq.remove(at: minIndex)
            if marked[edge.v()] == marked[edge.w()] {
                continue
            }
            mst.append(edge)
        }
    }
    
    private func visited(v: Int) {
        assert(marked[v], "重复遍历")
        marked[v] = true
        let adj = DenseGraph.adjTerrator.init(g: dg, v: v)
        var m = adj.begin()
        while !adj.end() {
            if let m0 = m, !marked[m0.other(x: v)] {
                pq.append(m0)
            }
            m = adj.next()
        }
    }
    
    func getMST() -> [Edge<Weight>] {
        return mst
    }
    
}
