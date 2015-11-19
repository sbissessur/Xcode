//
//  ViewController.swift
//  RedBlue Button
//
//  Created by Sahil Bissessur on 11/18/15.
//  Copyright © 2015 Sahil Bissessur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hideRed: UIButton!
    @IBOutlet weak var hideBlue: UIButton!
    @IBOutlet weak var redSpartan: UIImageView!
    @IBOutlet weak var blueSpartan: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hideRed(sender: AnyObject) {
        redSpartan.hidden = true
    }

    @IBAction func hideBlue(sender: AnyObject) {
        blueSpartan.hidden = true
    }
}

