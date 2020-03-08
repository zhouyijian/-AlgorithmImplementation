//
//  ViewController.swift
//  YouQuanTu
//
//  Created by 周一见 on 2020/3/8.
//  Copyright © 2020 周一见. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let e1 = Edge.init(a: 1, b: 5, weight: 0.5)
        let e2 = Edge.init(a: 2, b: 5, weight: 0.6)
        print(e1 == e2)
    }


}

