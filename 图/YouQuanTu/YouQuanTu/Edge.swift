//
//  Eage.swift
//  YouQuanTu
//
//  Created by 周一见 on 2020/3/8.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation

struct Edge<Weight: Comparable & Numeric>: Comparable {
    static func < (lhs: Edge<Weight>, rhs: Edge<Weight>) -> Bool {
        return lhs.weight < rhs.weight
    }
    
    static func <= (lhs: Edge<Weight>, rhs: Edge<Weight>) -> Bool {
        return lhs.weight <= rhs.weight
    }
    
    static func >= (lhs: Edge<Weight>, rhs: Edge<Weight>) -> Bool {
        return lhs.weight >= rhs.weight
    }
    
    static func > (lhs: Edge<Weight>, rhs: Edge<Weight>) -> Bool {
        return lhs.weight > rhs.weight
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.weight == rhs.weight
    }
    
    private var a: Int
    private var b: Int
    
    private var weight: Weight
    
    init(a: Int, b: Int, weight: Weight) {
        self.a = a
        self.b = b
        self.weight = weight
    }
    
    func v() -> Int {
        return a
    }
    
    func w() -> Int {
        return b
    }
    
    func wt() -> Weight {
        return weight
    }
    
    func other(x: Int) -> Int {
        assert(x != a && x != b, "x not edge!")
        return x == a ? b : a
    }
    
    
}
