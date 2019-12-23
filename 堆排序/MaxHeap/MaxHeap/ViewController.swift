//
//  ViewController.swift
//  MaxHeap
//
//  Created by 周一见 on 2019/12/23.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var maxHeap = MaxHeap<Int>.init(capacity: 100)
        for _ in 0..<100 {
            maxHeap.insert(element: Int.random(in: 0..<100))
        }
        print(maxHeap)
        for _ in 0..<100 {
            print(maxHeap.removeTop())
        }
        print(maxHeap.isEmpty())
        
    }

    

}

