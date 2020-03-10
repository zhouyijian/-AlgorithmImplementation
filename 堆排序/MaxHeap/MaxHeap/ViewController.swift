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
        var minHeap = MinHeap<Int>.init(capacity: 100)
        let count = 30
        for _ in 0..<count {
            minHeap.insert(value: Int.random(in: 0..<100))
        }
        for _ in 0..<count {
            print(minHeap.extractMin())
        }
        print(minHeap.isEmpty())
    
        
    }

    

}

