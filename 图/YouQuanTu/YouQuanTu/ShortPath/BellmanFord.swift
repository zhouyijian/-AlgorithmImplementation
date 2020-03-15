//
//  BellmanFord.swift
//  YouQuanTu
//
//  Created by 周一见 on 2020/3/15.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

class BellmanFord<Weight: Comparable & Numeric> {
    var g: SpreseGraph<Weight>
    var s: Int
    ///每个点距离指定点路径大小
    var distTo: Array<Weight>
    var hasNativeCicle = false
    var from: Array<Edge<Weight>?>
    
    init(g: SpreseGraph<Weight>, s: Int) {
        self.g = g
        self.s = s
        self.distTo = Array.init(repeating: Weight.init(exactly: 0)!, count: g.getNumber())
        self.from = Array.init(repeating: nil, count: g.getNumber())
        
        
        //进行图顶点数减一轮循环
        for _ in 1..<g.getNumber() {
            //每次对所有顶点进行松弛操作，即遍历所有顶点临边，查看是否可以经该顶点到达它临边的顶点所需花费更小
            for i in 0..<g.getNumber() {
                let adj = SpreseGraph.adjTerrator.init(g: g, v: i)
                var e = adj.begin()
                while !adj.end() {
                    if from[e!.w()] == nil || (distTo[e!.v()] + e!.wt()) < distTo[e!.w()] {
                        distTo[e!.w()] = distTo[e!.v()] + e!.wt()
                        from[e!.w()] = e
                    }
                    e = adj.next()
                }
            }
        }
        
        //最后进行一次松弛操作，如果图在经过V-1轮所有顶点松弛后，还可以继续松弛，说明图中出现了负权环
        getNativeCicle()
        
    }
    
    private func getNativeCicle() {
        for i in 0..<g.getNumber() {
             let adj = SpreseGraph.adjTerrator.init(g: g, v: i)
             var e = adj.begin()
             while !adj.end() {
                 if from[e!.w()] == nil || (distTo[e!.v()] + e!.wt()) < distTo[e!.w()] {
                     hasNativeCicle = true
                 }
                 e = adj.next()
             }
         }
    }
    
    func nativeCicle() -> Bool {
        return hasNativeCicle
    }
    
    func shortPathTo(w: Int) -> Weight {
        assert(w >= g.getNumber())
        return distTo[w]
    }
        
    func hasPathTo(w: Int) -> Bool {
        assert(w >= g.getNumber())
        return from[w] != nil
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
