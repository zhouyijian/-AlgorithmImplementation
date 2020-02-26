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
        for _ in 0...5 {
            sg.addEdge(v: Int.random(in: 0..<10), w: Int.random(in: 3..<7))
        }
        
    }


}

