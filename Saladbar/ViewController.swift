//
//  ViewController.swift
//  Saladbar
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import UIKit
import Tong
import ElastiQ

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let query: ElastiQ = ElastiQ().term("contentID", "-Ks8QKsGXfiufWXvaC1a")
        Post.search(query: query) { (result) in
            switch result {
            case .success(let response): print(response)
            case .failure(let error): print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

