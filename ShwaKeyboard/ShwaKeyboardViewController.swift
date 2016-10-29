//
//  ShwaKeyboardViewController.swift
//  ShwaKeyboard
//
//  Created by KyivMobileDev on 2/3/16.
//  Copyright © 2016 KyivMobileDev. All rights reserved.
//

import UIKit

class ShwaKeyboardViewController: UIViewController {

    @IBOutlet weak var testTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let modelName = UIDevice.currentDevice().model
        print("\(modelName)")
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        print("\(screenSize.width)")
        
        var frame = testTextView.frame
        frame.size.width = screenSize.width
        testTextView.frame = frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

