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
        let d = DenseGraph.init(n: 10, driected: false)
        print(d)
    }


}

