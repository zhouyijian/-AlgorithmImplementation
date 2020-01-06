//
//  BST.swift
//  BST
//
//  Created by 周一见 on 2020/1/6.
//  Copyright © 2020 周一见. All rights reserved.
//

import Foundation
struct BST<K: Comparable, V> {
    private class Node {
        var key: K
        var value: V?
        var left: Node?
        var right: Node?
        
        init(key: K, value: V?) {
            self.key = key
            self.value = value
        }
    }
    
    private var root: Node?
    private var count = 0
    
    func getSize() -> Int {
        return count
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    mutating func insert(key: K, value: V?) {
        let _ = insert(node: root, key: key, value: value)
    }
    
    private mutating func insert(node: Node?, key: K, value: V?) -> Node? {
        if node == nil {
            self.count += 1
            return Node.init(key: key, value: value)
        }
        if key == node!.key {
            node?.value = value
        } else if key < node!.key {
            node?.left = insert(node: node?.left, key: key, value: value)
        } else {
            node?.right = insert(node: node?.right, key: key, value: value)
        }
        return node
    }
    
    func contains(key: K) -> Bool {
        return contains(node: root, key: key)
    }
    
    private func contains(node: Node?, key: K) -> Bool {
        if node == nil {
            return false
        }
        if node!.key == key {
            return true
        } else if key < node!.key {
            return contains(node: node?.left, key: key)
        } else {
            return contains(node: node?.right, key: key)
        }
    }
    
    func search(key: K) -> V? {
        return search(node: root, key: key)
    }
    
    private func search(node: Node?, key: K) -> V? {
        if node == nil {
            return nil
        }
        if node!.key == key {
            return node?.value
        } else if key < node!.key {
            return search(node: node?.left, key: key)
        } else {
            return search(node: node?.right, key: key)
        }
    }
    
    //MARK: - 遍历元素
    //前序遍历
    func preOrder() {
        preOrder(node: root)
    }
    
    private func preOrder(node: Node?) {
        if node == nil {
            return
        }
        print(node!.key)
        preOrder(node: node?.left)
        preOrder(node: node?.right)
    }
    
    //中序遍历
    func inOrder() {
        inOrder(node: root)
    }
    
    private func inOrder(node: Node?) {
        if node == nil {
            return
        }
        inOrder(node: node?.left)
        print(node!.key)
        inOrder(node: node?.right)
    }
    
    //后序遍历
    func backOrder() {
        backOrder(node: root)
    }
    
    private func backOrder(node: Node?) {
        if node == nil {
            return
        }
        backOrder(node: node?.left)
        backOrder(node: node?.right)
        print(node!.key)
    }
    
    func cengxuOrder() {
        var queue = Array<Node>.init()
        if root != nil {
            queue.append(root!)
            while !queue.isEmpty {
                let node = queue.removeFirst()
                print(node.key)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
        }
    }
}

