//
//  TuLun.swift
//  TuLun
//
//  Created by 周一见 on 2020/1/14.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

typealias Matrix<T: Equatable> = Array<[T]>

///邻接矩阵，用于稠密图或完全图
class DenseGraph<Weight: Comparable & Numeric> {
    
    ///顶点数目
    private var n: Int
    ///边数目
    private var m: Int
    ///是否是有向图
    private var driected: Bool
    ///存储顶点关系的 n * n 矩阵
    private var g: Matrix<Edge<Weight>?>
    
    /// 初始化邻接矩阵
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
        if !isEdge(v: v, w: w) {
            m += 1
        }
        g[v][w] = Edge.init(a: v, b: w, weight: weight)
        if !driected {
            g[w][v] = Edge.init(a: v, b: w, weight: weight)
        }
    }
    
    private func isEdge(v: Int, w: Int) -> Bool {
        return g[v][w] != nil
    }
    
    class adjTerrator {
        private var g: DenseGraph
        private var v: Int
        private var index: Int
        
        init(g: DenseGraph, v: Int) {
            self.g = g
            self.v = v
            self.index = -1
        }
        
        func begin() -> Edge<Weight>? {
            self.index = -1
            return next()
        }
        
        func next() -> Edge<Weight>? {
            self.index += 1
            while self.index < self.g.g[v].count {
                if self.g.g[v][self.index] != nil {
                    return self.g.g[v][self.index]
                }
                self.index += 1
            }
            return nil
        }
        
        func end() -> Bool {
            return index >= g.g[v].count
        }
    }
}



