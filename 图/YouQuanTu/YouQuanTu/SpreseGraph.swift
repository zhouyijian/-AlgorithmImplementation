//
//  SpreseGraph.swift
//  TuLun
//
//  Created by 周一见 on 2020/2/23.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

///邻接表，用于稀疏图
class SpreseGraph<Weight: Comparable> {
    ///顶点数目
    private var n: Int
    ///边数目
    private var m: Int
    ///是否是有向图
    private var driected: Bool
    ///存储顶点关系的 n * r 表格，r 为每个 n 连接边数目
    fileprivate var g: Matrix<Edge<Weight>?>
    
    /// 初始化临接表
    /// - Parameters:
    ///   - n: 所有元素个数
    ///   - driected: 元素之间的连接是否有方向
    init(n: Int, driected: Bool) {
        self.n = n
        self.m = 0
        self.driected = driected
        g = []
        for _ in 0 ..< n {
            var vec: Array<Edge<Weight>?> = []
            for _ in 0 ..< n {
                vec.append(nil)
            }
            g.append(vec)
        }
    }
    
    ///获取图中元素数目
    func getNumber() -> Int {
        return n
    }
    
    ///获取图中所有边之和
    func getBorderNumber() -> Int {
        return m
    }
    
    ///将两者联合
    func addEdge(v: Int, w: Int, weight: Weight) {
        g[v].append(Edge<Weight>.init(a: v, b: w, weight: weight))
        if !driected {
            g[w].append(Edge<Weight>.init(a: v, b: w, weight: weight))
        }
        m += 1
    }
    
    private func isEdge(v: Int, w: Int, weight: Weight) -> Bool {
        var v_w = false
        for i in self.g[v] {
            if i?.other(x: v) == w {
                v_w = true
                if driected {
                    return true
                } else {
                    break
                }
            }
        }
        if v_w && !driected {
            for i in self.g[w] {
                if i?.other(x: w) == v {
                    return true
                }
            }
        }
        return false
    }
    
    class adjTerrator {
        private var g: SpreseGraph
        private var v: Int
        private var index: Int
        
        init(g: SpreseGraph, v: Int) {
            self.g = g
            self.v = v
            self.index = 0
        }
        
        func begin() -> Edge<Weight>? {
            if g.g[v].isEmpty {
                return nil
            } else {
                return g.g[v][0]
            }
        }
        
        func next() -> Edge<Weight>? {
            self.index += 1
            if self.index < g.g[v].count {
                return g.g[v][self.index]
            } else {
                return nil
            }
        }
        
        func end() -> Bool {
            return index >= g.g[v].count
        }
    }
    
}


