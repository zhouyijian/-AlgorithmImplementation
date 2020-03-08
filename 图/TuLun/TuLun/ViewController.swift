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
        let sg = SpreseGraph.init(n: 10, driected: false)
        let dg = DenseGraph.init(n: 10, driected: false)
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
        print("----")
        let c = Component.init(sp: sg)
        print("ccount\(c.ccountNumber())")
        print(c.isConnected(i: 0, j: 3))
        
        let d = Path.init(sp: sg, s: 5)
        d.showPath(w: 3)
        
        print("----")
        
        let s = ShortPath.init(sp: sg, s: 0)
        s.showPath(w: 6)
    }


}

