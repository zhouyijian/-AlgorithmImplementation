//
//  ShortPath.swift
//  TuLun
//
//  Created by 周一见 on 2020/3/4.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

class ShortPath {
    private var sp: SpreseGraph
    private var visited: [Bool]
    private var s: Int
    private var form: [Int]
    private var ord: [Int]
    
    init(sp: SpreseGraph, s: Int) {
        self.sp = sp
        self.visited = Array.init(repeating: false, count: sp.getNumber())
        self.s = s
        self.form = Array.init(repeating: -1, count: sp.getNumber())
        self.ord = Array.init(repeating: -1, count: sp.getNumber())
        
        self.dfs(s)
    }
    
    private func dfs(_ i: Int) {
        var q: [Int] = []
        q.append(i)
        visited[i] = true
        ord[i] = 0
        
        while !q.isEmpty {
            let v = q.removeFirst()
            let adj = SpreseGraph.adjTerrator.init(g: sp, v: v)
            var w = adj.begin()
            while !adj.end() {
                if !visited[w!] {
                    q.append(w!)
                    visited[w!] = true
                    form[w!] = v
                    ord[w!] = ord[v] + 1
                }
                w = adj.next()
            }
        }
    }
    
    func hasPath(w: Int) -> Bool {
        return visited[w]
    }
    
    func path(w: Int) -> [Int] {
        var path: [Int] = []
        var i = w
        while i != -1 {
            path.append(i)
            i = form[i]
        }
        return path.reversed()
    }
    
    func showPath(w: Int) {
        let path = self.path(w: w)
        for i in path {
            print("\(i) ->")
        }
        
    }
    
    func length(w: Int) -> Int {
        return ord[w]
    }
    
}
