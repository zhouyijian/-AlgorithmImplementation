//
//  Path.swift
//  TuLun
//
//  Created by 周一见 on 2020/3/4.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

class Path {
    private var sp: SpreseGraph
    private var visited: [Bool]
    private var s: Int
    private var form: [Int]
    
    init(sp: SpreseGraph, s: Int) {
        self.sp = sp
        self.visited = Array.init(repeating: false, count: sp.getNumber())
        self.s = s
        self.form = Array.init(repeating: -1, count: sp.getNumber())
        
        self.dfs(s)
    }
    
    private func dfs(_ i: Int) {
        visited[i] = true
        
        let adj = SpreseGraph.adjTerrator.init(g: sp, v: i)
        var w = adj.begin()
        while !adj.end() {
            if !visited[w!] {
                form[w!] = i
                dfs(w!)
            }
            w = adj.next()
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
    
}
