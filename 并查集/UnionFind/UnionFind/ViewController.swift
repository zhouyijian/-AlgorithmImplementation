//
//  ViewController.swift
//  UnionFind
//
//  Created by 周一见 on 2020/1/12.
//  Copyright © 2020 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let count = 200000
        var union = UnionFind.init(count: count)
        test(count: count, union: &union)
        
        var union2 = UnionFind2.init(count: count)
        test2(count: count, union: &union2)
    
        
    }
    
    
    func test(count: Int, union: inout UnionFind) {
        let start = Date().timeIntervalSince1970
        for _ in 0..<count {
            union.unionElements(Int.random(in: 0..<count), q: Int.random(in: 0..<count))
        }
        for _ in 0..<count {
            let _ = union.isConnected(Int.random(in: 0..<count), Int.random(in: 0..<count))
        }
        
        let end = Date().timeIntervalSince1970
        print(end - start)
    }
    
    func test2(count: Int, union: inout UnionFind2) {
        let start = Date().timeIntervalSince1970
        for _ in 0..<count {
            union.unionElements(Int.random(in: 0..<count), q: Int.random(in: 0..<count))
        }
        for _ in 0..<count {
            let _ = union.isConnected(Int.random(in: 0..<count), Int.random(in: 0..<count))
        }
        
        let end = Date().timeIntervalSince1970
        print(end - start)
    }
    


}

