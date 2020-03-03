//
//  Component.swift
//  TuLun
//
//  Created by 周一见 on 2020/3/3.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

class Component {
    private var sp: SpreseGraph
    private var visited: [Bool]
    private var ccount: Int
    private var ccountIDs: [Int]
    
    init(sp: SpreseGraph) {
        self.sp = sp
        self.visited = Array.init(repeating: false, count: sp.getNumber())
        self.ccount = 0
        self.ccountIDs = Array.init(repeating: 0, count: sp.getNumber())
        
        for i in 0..<sp.getNumber() {
            if !visited[i] {
                self.dfs(i)
                ccount += 1
            }
        }
    }
    
    private func dfs(_ i: Int) {
        visited[i] = true
        ccountIDs[i] = ccount
        
        let adj = SpreseGraph.adjTerrator.init(g: sp, v: i)
        var w = adj.begin()
        while !adj.end() {
            if !visited[w!] {
                dfs(w!)
            }
            w = adj.next()
        }
    }
    
    func ccountNumber() -> Int {
        return ccount
    }
    
    func isConnected(i: Int, j: Int) -> Bool {
        return ccountIDs[i] == ccountIDs[j]
    }
    
    
}
