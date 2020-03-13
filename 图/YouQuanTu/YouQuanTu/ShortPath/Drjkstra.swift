//
//  Drjkstra.swift
//  YouQuanTu
//
//  Created by 周一见 on 2020/3/13.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

class Drjkstra<Weight: Comparable & Numeric> {
    var g: SpreseGraph<Weight>
    var s: Int
    var weight: Array<Weight>
    var marked: Array<Bool>
    var from: Array<Edge<Weight>?>
    
    init(g: SpreseGraph<Weight>, s: Int) {
        self.g = g
        self.s = s
        self.weight = Array.init(repeating: Weight.init(exactly: 0)!, count: g.getNumber())
        self.marked = Array.init(repeating: false, count: g.getNumber())
        self.from = Array.init(repeating: nil, count: g.getNumber())
        
        var ipq = MinIndexHeap<Weight>.init(capacity: g.getNumber())
        self.weight[s] = Weight.init(exactly: 0)!
        self.marked[s] = true
        ipq.insert(index: s, value: weight[s])
        while !ipq.isEmpty() {
            let minIndex = ipq.getMixIndex()
            let _ = ipq.extractMin()
            marked[minIndex] = true
            
            let adj = SpreseGraph.adjTerrator.init(g: g, v: minIndex)
            var m = adj.begin()
            while !adj.end() {
                let w = m!.other(x: minIndex)
                if !marked[w] {
                    if from[w] == nil || (weight[minIndex] + m!.wt()) < weight[w] {
                        weight[w] = weight[minIndex] + m!.wt()
                        from[w] = m
                        if ipq.contains(index: w) {
                            ipq.changeIndex(index: w, value: m!.wt())
                        } else {
                            ipq.insert(index: w, value: m!.wt())
                        }
                    }
                }
                m = adj.next()
            }
            
        }
        
        
    }
    
    func shortPathTo(w: Int) -> Weight {
        assert(w >= g.getNumber())
        return weight[w]
    }
        
    func hasPathTo(w: Int) -> Bool {
        assert(w >= g.getNumber())
        return marked[w]
    }
    
    func shortPath(w: Int) -> [Edge<Weight>] {
        assert(w >= g.getNumber())
        var array = Array<Edge<Weight>>.init()
        var e = from[w]
        
        while e?.v() != e?.w() {
            array.append(e!)
            e = from[e!.v()]
        }
        
        return array.reversed()
    }
    
    func showPath(w: Int) {
        let path = shortPath(w: w)
        for (index, i) in path.enumerated() {
            if index == 0 {
                print(i.v())
            } else {
                print("->\(i.v())")
            }
        }
    }
    
    
    
}
