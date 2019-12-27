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
        var array = Array<Int>()
        let count = 30
        for _ in 0..<count {
            array.append(Int.random(in: 0..<count))
        }
        var maxHeap = MaxHeap<Int>.init(array: array)
        
        print(maxHeap)
        for i in 0..<count/2 {
            maxHeap.change(index: i, item: Int.random(in: 0..<count*2))
        }
        print(maxHeap)
        for _ in 0..<count {
            print(maxHeap.removeTop())
        }
        print(maxHeap.isEmpty())
        
    }

    

}

