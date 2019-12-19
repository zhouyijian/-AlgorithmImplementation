//
//  ViewController.swift
//  AdvancedSort
//
//  Created by 周一见 on 2019/12/19.
//  Copyright © 2019 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var array = SortHelper.getNearSortArray(number: 3000, swapNumber: 10)
        var array = SortHelper.getArray(number: 3000, left: -500, right: 25000)
        var array2 = array
        var array3 = array
        var array4 = array
        SortHelper.testTime(name: "SelectionSort", array: &array, closure: selectionSort)
        SortHelper.testTime(name: "InserSort", array: &array2, closure: inserSort)
        SortHelper.testTime(name: "ShellSort", array: &array3, closure: shellSort)
        SortHelper.testTime(name: "MergeSort", array: &array4, closure: mergeSort)
        SortHelper.testSort(array: array)
        SortHelper.testSort(array: array2)
        SortHelper.testSort(array: array3)
        SortHelper.testSort(array: array4)
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
    
    func mergeSort<T: Comparable>(array: inout Array<T>) {
        mergeSortPrivate(array: &array, left: 0, right: array.count - 1)
    }
    
    private func inserSort<T: Comparable>(array: inout Array<T>, left: Int, right: Int) {
        if array.count > 1 {
            var i = left + 1
            while i <= right {
                var j = i
                let inserNum = array[i]
                while j > left {
                    if inserNum < array[j - 1] {
                        array[j] = array[j - 1]
                        j = j - 1
                    } else {
                        break
                    }
                }
                array[j] = inserNum
                i += 1
            }

        }
    }
    
    private func mergeSortPrivate<T: Comparable>(array: inout Array<T>, left: Int, right: Int) {
        if left >= right {
            return
        }
        if right - left <= 15 {
            inserSort(array: &array, left: left, right: right)
            return
        }
        let mid = (left + right) / 2
        mergeSortPrivate(array: &array, left: left, right: mid)
        mergeSortPrivate(array: &array, left: mid + 1, right: right)
        if array[mid] > array[mid + 1] {
           merge(array: &array, left: left, middle: mid, right: right)
        }
    }
    
    private func merge<T: Comparable>(array: inout Array<T>, left: Int, middle: Int, right: Int) {
        let count = right - left + 1
        var array2 = Array<T>.init()
        for i in 0..<count {
            array2.append(array[i + left])
        }
        var i = 0
        var j = middle - left + 1
        var k = left
        
        while k <= right {
            if i > middle - left && j <= right - left {
                array[k] = array2[j]
                j += 1
                k += 1
                continue
            } else if j > right - left && i <= middle - left {
                array[k] = array2[i]
                i += 1
                k += 1
                continue
            } else if array2[i] < array2[j] {
                array[k] = array2[i]
                i += 1
                k += 1
            } else {
                array[k] = array2[j]
                j += 1
                k += 1
            }
        }
    }
    
}

