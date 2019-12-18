//
//  ViewController.swift
//  SelectionSort
//
//  Created by 周一见 on 2019/12/17.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //var array = SortHelper.getNearSortArray(number: 2500, swapNumber: 100)
        var array = SortHelper.getArray(number: 2500, left: -500, right: 25000)
        var array2 = array
        var array3 = array
        SortHelper.testTime(name: "SelectionSort", array: &array, closure: selectionSort)
        SortHelper.testTime(name: "InserSort", array: &array2, closure: inserSort)
        SortHelper.testTime(name: "ShellSort", array: &array3, closure: shellSort)
        SortHelper.testSort(array: array)
        SortHelper.testSort(array: array2)
        SortHelper.testSort(array: array3)
    }

    func selectionSort<T: Comparable>(array: inout Array<T>) {
        for i in 0..<array.count {
            var minIndex = i
            for j in i..<array.count {
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            array.swapAt(i, minIndex)
        }
    }
    
    func inserSort<T: Comparable>(array: inout Array<T>) {
        if array.count > 1 {
            for i in 1..<array.count {
                var k = i
                let inserNum = array[i]
                for j in (1...i).reversed() {
                    if inserNum < array[j - 1] {
                        array[j] = array[j - 1]
                        k = j - 1
                    } else {
                        break
                    }
                }
                array[k] = inserNum
            }
        }
    }
    
    func shellSort<T: Comparable>(array: inout Array<T>) {
        var gap = array.count / 2 //分组个数
        while gap > 0 {
            var i = gap //从第 gap 个元素开始，遍历完数组，对每一组都进行插入排序
            while i < array.count {
                var j = i
                //遍历每一组的所有元素，直到找到合适位置插入（要么走到这组的第一个元素，要么在中途发现自己是此组最大元素）
                while j - gap >= 0 && array[j] < array[j - gap] {
                    array.swapAt(j, j - gap)
                    j -= gap
                }
                i += 1
            }
            gap /= 2
        }
    }

}

