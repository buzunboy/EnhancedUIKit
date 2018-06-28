//
//  ViewController.swift
//  EUKitDemo
//
//  Created by Burak Uzunboy on 21.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import EUIKit

class ViewController: CoverTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeCoverImage(with: UIImage(named: "first")!)
        self.changeCoverImageHeight(to: 100)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

