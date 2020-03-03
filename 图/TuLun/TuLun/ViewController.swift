//
//  ViewController.swift
//  TuLun
//
//  Created by 周一见 on 2020/1/14.
//  Copyright © 2020 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var sg = SpreseGraph.init(n: 10, driected: false)
        var dg = DenseGraph.init(n: 10, driected: false)
        for _ in 0...5 {
            sg.addEdge(v: Int.random(in: 0..<10), w: Int.random(in: 3..<7))
            dg.addEdge(v: Int.random(in: 0..<10), w: Int.random(in: 3..<7))
        }
        
        for i in 0..<10 {
            print("\(i): ")
            let adj = SpreseGraph.adjTerrator.init(g: sg, v: i)
            var w = adj.begin()
            while !adj.end() {
                print(w!)
                w = adj.next()
            }
        }
        
        let c = Component.init(sp: sg)
        print("ccount\(c.ccountNumber())")
        print(c.isConnected(i: 0, j: 3))
        
        
        print("-----")
        
        for i in 0..<10 {
            print("\(i): ")
            let adj = DenseGraph.adjTerrator.init(g: dg, v: i)
            var w = adj.begin()
            while !adj.end() {
                print(w!)
                w = adj.next()
            }
        }
    }


}

