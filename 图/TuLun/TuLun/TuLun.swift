//
//  TuLun.swift
//  TuLun
//
//  Created by 周一见 on 2020/1/14.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

typealias Matrix<T> = Array<[T]>

///邻接矩阵，用于稠密图或完全图
struct DenseGraph {
    ///顶点数目
    private var n: Int
    ///边数目
    private var m: Int
    ///是否是有向图
    private var driected: Bool
    ///存储顶点关系的 n * n 矩阵
    private var g: Matrix<Bool>
    
    /// 初始化邻接矩阵
    /// - Parameters:
    ///   - n: 所有元素个数
    ///   - driected: 元素之间的连接是否有方向
    init(n: Int, driected: Bool) {
        self.n = n
        self.m = 0
        self.driected = driected
        let vec = Array.init(repeating: false, count: n)
        self.g = Array.init(repeating: vec, count: n)
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
    mutating func addEdge(v: Int, w: Int) {
        if !isEdge(v: v, w: w) {
            g[v][w] = true
            if !driected {
                g[w][v] = true
            }
            m += 1
        }
    }
    
    private func isEdge(v: Int, w: Int) -> Bool {
        return g[v][w]
    }
}

///临接表，用于稀疏图
struct SpreseGraph {
    ///顶点数目
    private var n: Int
    ///边数目
    private var m: Int
    ///是否是有向图
    private var driected: Bool
    ///存储顶点关系的 n * r 表格，r 为每个 n 连接边数目
    private var g: Matrix<Int>
    
    /// 初始化临接表
    /// - Parameters:
    ///   - n: 所有元素个数
    ///   - driected: 元素之间的连接是否有方向
    init(n: Int, driected: Bool) {
        self.n = n
        self.m = 0
        self.driected = driected
        self.g = Array.init(repeating: Array<Int>.init(), count: n)
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
    mutating func addEdge(v: Int, w: Int) {
        g[v].append(w)
        if !driected {
            g[w].append(v)
        }
        m += 1
    }
    
    private func isEdge(v: Int, w: Int) -> Bool {
        var v_w = false
        for i in self.g[v] {
            if i == w {
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
                if i == v {
                    return true
                }
            }
        }
        return false
    }
    
}
