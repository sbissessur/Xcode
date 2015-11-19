//
//  ViewController.swift
//  SuperCool2
//
//  Created by Sahil Bissessur on 11/17/15.
//  Copyright © 2015 Sahil Bissessur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var superstarButton: UIButton!
    @IBOutlet weak var superstarVal: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doShowSuperStar(sender: AnyObject) {
        superstarVal.hidden = false
        superstarButton.hidden = true
    }

}

