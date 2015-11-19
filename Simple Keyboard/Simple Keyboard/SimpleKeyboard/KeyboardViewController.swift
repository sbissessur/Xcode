//
//  KeyboardViewController.swift
//  SimpleKeyboard
//
//  Created by Sahil Bissessur on 11/16/15.
//  Copyright © 2015 Sahil Bissessur. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    // declared button
    var helloButton: UIButton!
    
    // need DELETE and HIDE KEYBOARD button
    var deleteButton: UIButton!
    
    // HIDE BUTTON
    var hideButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    // adds all buttons
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNextButton()
        addHelloButton()
        addDeleteButton()
        addHideButton()
    }
    
    func addHideButton() {
        hideButton = UIButton(type: .System)
        hideButton.setTitle("Hide", forState: .Normal)
        hideButton.sizeToFit()
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        
        hideButton.addTarget(self, action: Selector("dismissKeyboard"), forControlEvents:  .TouchUpInside)
        
        self.view.addSubview(hideButton)
        
        // need to set constraints for auto-layout (different screen sizes)
        // bottom right of keyboard
        let backButtonBottomY = NSLayoutConstraint(item: hideButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        let backButtonBottomX = NSLayoutConstraint(item: hideButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: +10.0)
        
        self.view.addConstraint(backButtonBottomX)
        self.view.addConstraint(backButtonBottomY)
    }
    
    // don't have to add dismissKeyboard, it already exists
    
    func addDeleteButton() {
        deleteButton = UIButton(type: .System)
        deleteButton.setTitle("Delete", forState: .Normal)
        deleteButton.sizeToFit()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        deleteButton.addTarget(self, action: Selector("deleteText"), forControlEvents:  .TouchUpInside)
        
        self.view.addSubview(deleteButton)
        
        // need to set constraints for auto-layout (different screen sizes)
        // bottom right of keyboard
        let backButtonBottomY = NSLayoutConstraint(item: deleteButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        let backButtonBottomX = NSLayoutConstraint(item: deleteButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        
        self.view.addConstraint(backButtonBottomX)
        self.view.addConstraint(backButtonBottomY)
        
    }
    
    func deleteText() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    func addHelloButton() {
        helloButton = UIButton(type: .System)
        helloButton.setTitle("Hello", forState: .Normal)
        helloButton.sizeToFit()
        helloButton.translatesAutoresizingMaskIntoConstraints = false
        
        helloButton.addTarget(self, action: Selector("helloButtonPressed"), forControlEvents:  .TouchUpInside)
        
        self.view.addSubview(helloButton)
        
        // need to set constraints for auto-layout (different screen sizes)
        // middle x and middle y to center the button
        let helloButtonY = NSLayoutConstraint(item: helloButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        
        let helloButtonX = NSLayoutConstraint(item: helloButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        
        // add buttons to the view as a subconstraint
        self.view.addConstraint(helloButtonY)
        self.view.addConstraint(helloButtonX)
    }
    
    func helloButtonPressed() {
        
        // instead of printing out to the console
        // we are actually going to add text with our keyboard
        // have to add some constraints
        
        // have to create a constant
        // reason it's called proxy is to set text in a text field you have to set a UItextdocumentproxy
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("Hello ")
    }
    
    func addNextButton() {
        self.nextKeyboardButton = UIButton(type: .System)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
