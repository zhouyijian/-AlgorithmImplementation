//
//  ViewController.swift
//  BST
//
//  Created by 周一见 on 2019/12/29.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var a:[Int] = []
        for i in 0..<10 {
            a.append(i)
        }
        print(bstSearch(array: a, item: 3)!)
    }

    ///传入有序数组和要查找的元素，返回该元素所在的索引
    func bstSearch<T: Comparable>(array: [T], item: T) -> Int? {
        var left = 0
        var right = array.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            if array[mid] == item {
                return mid
            } else if item < array[mid]  {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return nil
    }
    
}

