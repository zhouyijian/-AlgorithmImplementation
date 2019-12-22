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
        //var array = SortHelper.getNearSortArray(number: 500000, swapNumber: 100)
        var array = SortHelper.getArray(number: 300000, left: 0, right: 10)
        var array2 = array
        var array3 = array
        
        SortHelper.testTime(name: "MergeSort", array: &array, closure: mergeSort)
        SortHelper.testTime(name: "QuickSort", array: &array2, closure: quickSort)
        SortHelper.testTime(name: "QuickSort3", array: &array3, closure: quickSort3)
        SortHelper.testSort(array: array)
        SortHelper.testSort(array: array2)
        SortHelper.testSort(array: array3)
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
    
    func quickSort<T: Comparable>(array: inout Array<T>) {
        quickSort(array: &array, left: 0, right: array.count - 1)
    }
    
    func quickSort3<T: Comparable>(array: inout Array<T>) {
        quickSort3(array: &array, left: 0, right: array.count - 1)
    }
    
    private func quickSort<T: Comparable>(array: inout Array<T>, left: Int, right: Int) {
        if right - left <= 15 {
            inserSort(array: &array, left: left, right: right)
            return
        }
        if left >= right {
            return
        }
        let p = partition2(array: &array, left: left, right: right)
        quickSort(array: &array, left: left, right: p)
        quickSort(array: &array, left: p + 1, right: right)
    }
    
    private func quickSort3<T: Comparable>(array: inout Array<T>, left: Int, right: Int) {
        if right - left <= 15 {
            inserSort(array: &array, left: left, right: right)
            return
        }
        if left >= right {
            return
        }
        var lt = left //array[left+1...lt] < t
        var gt = right + 1 //array[gt...right] > t
        var i = left + 1 //array[lt...i - 1] == t
        
        let v = Int.random(in: left...right)
        array.swapAt(left, v)
        let t = array[left]
        
        while i < gt {
            if array[i] < t {
                array.swapAt(i, lt + 1)
                i += 1
                lt += 1
            } else if array[i] > t {
                array.swapAt(i, gt - 1)
                gt -= 1
            } else {
                i += 1
            }
        }
        
        quickSort3(array: &array, left: left, right: lt)
        quickSort3(array: &array, left: gt, right: right)
        
    }
    
    private func partition<T: Comparable>(array: inout Array<T>, left: Int, right: Int) -> Int {
        var i = left + 1
        var j = left
        let v = Int.random(in: left...right)
        array.swapAt(left, v)
        while i <= right {
            if array[i] < array[left] {
                array.swapAt(i, j + 1)
                j += 1
            }
            i += 1
        }
        array.swapAt(left, j)
        return j
    }
    
    private func partition2<T: Comparable>(array: inout Array<T>, left: Int, right: Int) -> Int {
        let v = Int.random(in: left...right)
        array.swapAt(left, v)
        let t = array[left]
        var i = left + 1
        var j = right
        while i <= j {
            while i <= right && array[i] < t {
                i += 1
            }
            while j >= left + 1 && array[j] > t {
                j -= 1
            }
            if i <= j {
                array.swapAt(i, j)
                i += 1
                j -= 1
            }
        }
        array.swapAt(left, j)
        return j
    }
    
}

