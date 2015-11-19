//
//  ViewController.swift
//  SuperCool
//
//  Created by Sahil Bissessur on 11/17/15.
//  Copyright © 2015 Sahil Bissessur. All rights reserved.
//

// IBoutlet: a variable that is a reference to the user interface element (pointer)

// IBactions: an action, when performed on the UI, that takes place on the code

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var coolLogo: UIImageView!
    @IBOutlet weak var coolBg: UIImageView!
    @IBOutlet weak var uncoolButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func makeMeNotSoUncool(sender: AnyObject) {
        coolLogo.hidden = false
        coolBg.hidden = false
        uncoolButton.hidden = true
    }

}

