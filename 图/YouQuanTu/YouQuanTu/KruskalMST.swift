//
//  KruskalMST.swift
//  YouQuanTu
//
//  Created by 周一见 on 2020/3/13.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

class KruskalMST<Weight: Comparable> {
    private var dg: DenseGraph<Weight>
    ///最小生成树边的数组
    private var mst:[Edge<Weight>] = []
    
    init(g: DenseGraph<Weight>) {
        self.dg = g
        var pq = MinHeap<Edge<Weight>>.init(capacity: g.getNumber())
        for i in 0..<g.getNumber() {
            let adj = DenseGraph.adjTerrator.init(g: g, v: i)
            var m = adj.begin()
            while !adj.end() {
                pq.insert(value: m!)
                m = adj.next()
            }
        }
        var uf = UnionFind.init(count: g.getNumber())
        while !pq.isEmpty() {
            let min = pq.extractMin()
            if !uf.isConnected(min.v(), min.w()) {
                uf.unionElements(min.v(), q: min.w())
                mst.append(min)
            }
        }
    }
    

    
    func getMST() -> [Edge<Weight>] {
        return mst
    }
    
}
