//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by KyivMobileDev on 2/3/16.
//  Copyright © 2016 KyivMobileDev. All rights reserved.
//

/*

 _______________________
|                       |   05      06      07      08
|                       |
|                       |
|                       |   09      10      11      12
|                       |
|                       |
|                       |   13      14      15      16
|                       |
 -----------------------
        00                  17      18      19      20
Delete Home Back Return

01    02     03     04      21      22      23      24

*/


import UIKit

class KeyboardViewController: UIInputViewController {

    let controls = [0xE015, 0xE019, 0xE01D, 0xE030]
    
    let rows = [[0xE080, 0xE088, 0xE0B0, 0xE0D8,    0xE074, 0xE090, 0xE0B8, 0xE0E0,     0xE078, 0xE098, 0xE098, 0xE0E8,     0xE07C, 0xE0A0, 0xE0C8, 0xE0F0,     0xE070, 0xE0A8, 0xE0D0, 0xE0F8], // 00
        
                [0xE015, 0xE016, 0xE017, 0xE018,    0xE011, 0xE012, 0xE013, 0xE014,     0xE000, 0xE001, 0xE002, 0xE003,     0xE01F, 0xE004, 0xE005, 0xE006,     0xE070, 0xE007, 0xE008, 0xE009], // 01
        
                [0xE019, 0xE01A, 0xE01B, 0xE01C,    0xE01F, 0xE00C, 0xE00B, 0xE00A,     0xE010, 0xE00F, 0xE00E, 0xE00D,     0xE000, 0xE001, 0xE002, 0xE003,     0xE070, 0xE004, 0xE005, 0xE006], // 02
        
                [0xE000, 0xE001, 0xE002, 0xE003,    0xE004, 0xE005, 0xE006, 0xE007,     0xE008, 0xE009, 0xE00A, 0xE00B,     0xE00C, 0xE00D, 0xE00E, 0xE00F,     0xE070, 0xE01D, 0xE010, 0xE01F], // 03
        
                [0xE020, 0xE021, 0xE022, 0xE026,    0xE023, 0xE024, 0xE025, 0xE027,     0xE028, 0xE033, 0xE035, 0xE037,     0xE029, 0xE032, 0xE034, 0xE038,     0xE070, 0xE030, 0xE031, 0xE036], // 04
        
                [0xE100, 0xE101, 0xE106, 0xE10B,    0x0000, 0xE102, 0xE107, 0xE10C,     0x0000, 0xE103, 0xE108, 0xE10D,     0x0000, 0xE104, 0xE109, 0xE10E,     0xE080, 0xE105, 0xE10A, 0xE10F], // 05
        
                [0xE110, 0x0000, 0x0000, 0x0000,    0xE089, 0xE112, 0x0000, 0x0000,     0xE08A, 0x0000, 0xE118, 0x0000,     0xE08B, 0x0000, 0x0000, 0x0000,     0xE088, 0x0000, 0xE11A, 0x0000], // 06
        
                [0xE160, 0x0000, 0x0000, 0xE16B,    0xE0B1, 0xE162, 0x0000, 0xE16C,     0xE0B2, 0x0000, 0x0000, 0xE16D,     0xE0B3, 0x0000, 0x0000, 0x0000,     0xE0B0, 0x0000, 0x0000, 0x0000], // 07
        
                [0xE1B0, 0xE1B1, 0x0000, 0x0000,    0xE0D9, 0x0000, 0x0000, 0xE1BC,     0xE0DA, 0x0000, 0xE1B8, 0xE1BD,     0xE0DB, 0x0000, 0x0000, 0x0000,     0xE0D8, 0x0000, 0xE1BA, 0x0000], // 08
        
                [0x0000, 0xE08D, 0xE0B5, 0xE0DD,    0xE075, 0xE095, 0xE0BD, 0xE0E5,     0xE076, 0x0000, 0x0000, 0xE0ED,     0xE077, 0xE0A5, 0xE0CD, 0xE0F5,     0xE074, 0xE0AD, 0xE0D5, 0xE0FD], // 09
        
                [0xE120, 0xE121, 0x0000, 0xE12B,    0xE091, 0xE122, 0xE127, 0xE12C,     0xE092, 0x0000, 0xE128, 0xE12D,     0xE093, 0x0000, 0x0000, 0xE12E,     0xE090, 0x0000, 0xE12A, 0xE12F], // 10
        
                [0xE170, 0xE171, 0x0000, 0x0000,    0xE0B9, 0xE172, 0xE177, 0x0000,     0xE0BA, 0x0000, 0xE178, 0x0000,     0xE0BB, 0x0000, 0x0000, 0x0000,     0xE0B8, 0x0000, 0xE17A, 0x0000], // 11
        
                [0xE1C0, 0xE1C1, 0x0000, 0x0000,    0xE0E1, 0x0000, 0xE1C7, 0xE1CC,     0xE0E2, 0xE1C3, 0xE1C8, 0xE1CD,     0xE0E3, 0x0000, 0x0000, 0xE1CE,     0xE0E0, 0x0000, 0x0000, 0xE1CF], // 22
        
                [0x0000, 0xE08E, 0xE0B6, 0xE0DE,    0xE079, 0xE096, 0xE0BE, 0xE0E6,     0xE07A, 0x0000, 0x0000, 0xE0EE,     0xE07B, 0xE0A6, 0xE0CE, 0xE0F6,     0xE078, 0xE0AE, 0xE0D6, 0xE0FE], // 13
        
                [0xE130, 0xE131, 0x0000, 0xE13B,    0x0000, 0xE132, 0xE137, 0xE13C,     0x0000, 0x0000, 0xE138, 0xE13D,     0x0000, 0x0000, 0x0000, 0xE13E,     0x0000, 0x0000, 0xE13A, 0xE13F], // 14
        
                [0xE180, 0xE181, 0x0000, 0xE18B,    0x0000, 0xE182, 0xE187, 0xE18C,     0x0000, 0xE183, 0xE188, 0xE18D,     0x0000, 0x0000, 0x0000, 0xE18E,     0x0000, 0x0000, 0xE18A, 0xE18F], // 15
        
                [0xE1D0, 0xE1D1, 0x0000, 0x0000,    0xE0E9, 0xE1D2, 0xE1D7, 0xE1DC,     0xE0EA, 0xE1D3, 0xE1D8, 0xE1DD,     0xE0EB, 0xE1D4, 0xE1D9, 0xE1DE,     0xE0E8, 0x0000, 0x0000, 0xE1DF], // 16
        
                [0x0000, 0xE08F, 0xE0B7, 0xE0DF,    0xE07D, 0xE097, 0xE0BF, 0xE0E7,     0xE07E, 0x0000, 0x0000, 0xE0EF,     0xE07F, 0xE0A7, 0xE0CF, 0xE0F7,     0xE07C, 0xE0AF, 0xE0D7, 0xE0FF], // 17
        
                [0xE140, 0xE141, 0x0000, 0xE14B,    0xE0A1, 0xE142, 0xE147, 0xE14C,     0xE0A2, 0xE143, 0xE148, 0xE14D,     0xE0A3, 0x0000, 0xE149, 0xE14E,     0xE0A0, 0x0000, 0xE14A, 0xE14F], // 18
        
                [0xE190, 0xE191, 0x0000, 0x0000,    0xE0C9, 0xE192, 0xE197, 0xE19C,     0xE0CA, 0x0000, 0xE198, 0xE19D,     0xE0CB, 0x0000, 0x0000, 0x0000,     0xE0C8, 0x0000, 0xE19A, 0x0000], // 19
        
                [0xE1E0, 0xE1E1, 0x0000, 0x0000,    0xE0F1, 0xE1E2, 0xE1E7, 0xE1EC,     0xE0F2, 0xE1E3, 0xE1E8, 0xE1ED,     0xE0F3, 0xE1E4, 0xE1E9, 0xE1EE,     0xE0F0, 0x0000, 0x0000, 0xE1EF], // 20
        
                [0xE084, 0xE08C, 0xE0B4, 0xE0DC,    0xE071, 0xE094, 0xE0BC, 0xE0E4,     0xE072, 0x0000, 0x0000, 0xE0EC,     0xE073, 0xE0A4, 0xE0CC, 0xE0F4,     0xE070, 0xE0AC, 0xE0D4, 0xE0FC], // 21
        
                [0xE150, 0xE151, 0x0000, 0x0000,    0xE0A9, 0xE152, 0xE157, 0x0000,     0xE0AA, 0xE153, 0xE158, 0x0000,     0xE0AB, 0x0000, 0x0000, 0x0000,     0xE0A8, 0x0000, 0xE15A, 0x0000], // 22
        
                [0xE1A0, 0xE1A1, 0x0000, 0xE1AB,    0xE0D1, 0xE1A2, 0xE1A7, 0xE1AC,     0xE0D2, 0xE1A3, 0x0000, 0xE1AD,     0xE0D3, 0x0000, 0x0000, 0x0000,     0xE0D0, 0x0000, 0xE1AA, 0x0000], // 23
        
                [0xE1F0, 0x0000, 0x0000, 0x0000,    0xE0F9, 0x0000, 0x0000, 0xE1FC,     0xE0FA, 0xE1F3, 0x0000, 0xE1FD,     0xE0FB, 0xE0F0,0x0000, 0x0000,      0xE0F8, 0x0000, 0xE1FA, 0x0000], // 24
               ]
    
    var fontName: String = String("DushanShwaAlphabet")
    
    let padding: CGFloat = 3.0
    
    var keyboardHeight: CGFloat = 0.0
    var keyboardWidth: CGFloat = 0.0
    var keybuttonWidth: CGFloat = 0.0
    var keybuttonHeight: CGFloat = 0.0
    
    var nextKeyButton: UIButton!
    var deleteActionButton: UIButton?
    var homeActionButton: UIButton?
    var backActionButton: UIButton?
    var returnActionButton: UIButton?
    
    var control01Button: UIButton?
    var control02Button: UIButton?
    var control03Button: UIButton?
    var control04Button: UIButton?
    
    var inputPreview: UITextView?
    var keyboardLayout: UIView?
    var actionLayout: UIView?
    var controlLayout: UIView?
    
    var ellipsisMode = false
    var previewTextArray = [""]
    
    var numKeyboardLayout = 0
    
    var keyboardInputModeArray = [0]
    
    var timer: NSTimer?
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        if self.view.frame.size.width == 0 || self.view.frame.size.height == 0 {
            return
        }
        
        keyboardWidth = self.view.frame.size.width
        keyboardHeight = self.view.frame.size.height
        keybuttonWidth = keyboardWidth * 0.125
        keybuttonHeight = keyboardHeight * 0.2
        
        print("keyboard Size: \(keyboardWidth), \(keyboardHeight)")
        drawKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 185.0/255, green: 185.0/255, blue: 190.0/255, alpha: 1)
        
        self.nextKeyButton = UIButton(type: .System)
        self.nextKeyButton.setTitle(NSLocalizedString(" ", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyButton.sizeToFit()
        self.nextKeyButton.translatesAutoresizingMaskIntoConstraints = false
    
        self.nextKeyButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyButton)
    
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }
    
    func drawKeyboard() {
        
        if keyboardHeight == 0.0 || keyboardWidth == 0.0 {
            return
        }
        
        // Input View
        addInputPreview(CGRect(x: padding, y: padding, width: (keybuttonWidth * 4 - padding * 2), height: (keybuttonHeight * 3 - padding * 2)))
        
        // Action View
        addActionLayout(CGRect(x: 0, y: keybuttonHeight * 3.0, width: keybuttonWidth * 4.0, height: keybuttonHeight))
        
        // Control Voew
        addControlLayout(CGRect(x: 0, y: keybuttonHeight * 4.0, width: keybuttonWidth * 4.0, height: keybuttonHeight))
        
        //Keyboard Layout
        addKeyboardLayout()
    }
    
    func addInputPreview(rect: CGRect) -> Void {
        if (inputPreview == nil) {
            inputPreview = UITextView(frame: rect)
            inputPreview?.userInteractionEnabled = false
            inputPreview?.textAlignment = .Right
            inputPreview?.font = UIFont(name: fontName, size: keybuttonHeight * 0.6)!
            
            inputPreview!.layer.cornerRadius = 5;
            
            self.view.addSubview(inputPreview!)
        }
        else {
            inputPreview?.frame = rect
        }
        
        if previewTextArray.count != 0 {
            inputPreview?.frame = CGRect(x: padding, y: padding, width: (keybuttonWidth * 4 - padding * 2), height: (keybuttonHeight * 3 - padding * 2))
            
            let textFont: UIFont =  UIFont(name: fontName, size: keybuttonHeight * 0.6)!
            let textFontAttributes = [NSFontAttributeName: textFont]
            
            inputPreview?.font = textFont
            
            var previewText: String = String("")
            
            let ellipsisText: String = String("...")
            let ellipsisTextSize = ellipsisText.sizeWithAttributes(textFontAttributes)
            
            if (inputPreview != nil) {
                for (var i = previewTextArray.count; i > 0; i--) {
                    previewText = previewText.stringByAppendingString(previewTextArray[i - 1])
                    let previewTextSize = previewText.sizeWithAttributes(textFontAttributes)
                    
                    if (previewTextSize.width + ellipsisTextSize.width + 8 * 2) > inputPreview!.frame.width {
                        previewText = previewText.substringToIndex(previewText.endIndex.predecessor())
                        previewText = previewText.stringByAppendingString(ellipsisText)
                        
                        ellipsisMode = true
                        break
                    }
                    
                    if i == 1 {
                        ellipsisMode = false
                    }
                }
                
                inputPreview!.text = String(previewText.characters.reverse())
            }
        }
    }
    
    func addActionLayout(rect: CGRect) -> Void {
        
        if (actionLayout == nil) {
            actionLayout  = UIView(frame: rect)
            self.view.addSubview(actionLayout!)
        }
        else {
            for view in actionLayout!.subviews {
                view.removeFromSuperview()
            }
            
            actionLayout?.frame = rect
        }
        
        deleteActionButton = addKeyboardActionButton(CGRect(x: 0, y: 0, width: keybuttonWidth, height: keybuttonHeight), title: "Delete")
        homeActionButton = addKeyboardActionButton(CGRect(x: keybuttonWidth, y: 0, width: keybuttonWidth, height: keybuttonHeight), title: "Home")
        backActionButton = addKeyboardActionButton(CGRect(x: keybuttonWidth * 2, y: 0, width: keybuttonWidth, height: keybuttonHeight), title: "Back")
        returnActionButton = addKeyboardActionButton(CGRect(x: keybuttonWidth * 3, y: 0, width: keybuttonWidth, height: keybuttonHeight), title: "Enter")
        
        if numKeyboardLayout == 0 {
            homeActionButton!.userInteractionEnabled = false
            backActionButton!.userInteractionEnabled = false
        }
    }
    
    func addKeyboardActionButton(rect: CGRect, title: String) -> UIButton {
       
        let button = UIButton(type: .Custom) as UIButton
        
        button.frame = rect
        
        button.setBackgroundImage(UIImage(named: "normal.png"), forState:.Normal)
        button.setBackgroundImage(UIImage(named: "pressed.png"), forState:.Highlighted)
        button.contentVerticalAlignment = .Center
        button.contentHorizontalAlignment = .Center
        
        if title == "Delete" {
            button.setImage(UIImage(named: "delete_normal.png"), forState:.Normal)
            
            button.addTarget(self, action: Selector("deleteKeyDown:"), forControlEvents: .TouchDown)
            button.addTarget(self, action: Selector("deleteKeyPressed:"), forControlEvents: .TouchUpInside)
        }
        
        if title == "Home" {
            button.setImage(UIImage(named: "home_normal.png"), forState:.Normal)
            
            button.addTarget(self, action: "homeKeyPressed:", forControlEvents: .TouchUpInside)
        }
        
        if title == "Back" {
            button.setImage(UIImage(named: "back_normal.png"), forState:.Normal)
            
            button.addTarget(self, action: "backKeyPressed:", forControlEvents: .TouchUpInside)
        }
            
        if title == "Enter" {
            button.setImage(UIImage(named: "enter_normal.png"), forState:.Normal)
            
            button.addTarget(self, action: "returnKeyPressed:", forControlEvents: .TouchUpInside)
        }
        
        self.actionLayout!.addSubview(button)
        
        return button
    }
    
    func addControlLayout(rect: CGRect) -> Void {
        
        if (controlLayout == nil) {
            controlLayout  = UIView(frame: rect)
            self.view.addSubview(controlLayout!)
        }
        else {
            for view in controlLayout!.subviews {
                view.removeFromSuperview()
            }
            
            controlLayout?.frame = rect
        }
        
        addKeyboardControlButton(CGRect(x: 0, y: 0, width: keybuttonWidth, height: keybuttonHeight), tag: 1)
        addKeyboardControlButton(CGRect(x: keybuttonWidth, y: 0, width: keybuttonWidth, height: keybuttonHeight), tag: 2)
        addKeyboardControlButton(CGRect(x: keybuttonWidth * 2, y: 0, width: keybuttonWidth, height: keybuttonHeight), tag: 3)
        addKeyboardControlButton(CGRect(x: keybuttonWidth * 3, y: 0, width: keybuttonWidth, height: keybuttonHeight), tag: 4)
    }
    
    func addKeyboardControlButton(rect: CGRect, tag: Int) {
        
        let button = UIButton(type: .Custom) as UIButton
        
        button.frame = rect
        
        button.setBackgroundImage(UIImage(named: "normal.png"), forState:.Normal)
        button.setBackgroundImage(UIImage(named: "pressed.png"), forState:.Highlighted)
        button.contentVerticalAlignment = .Center
        button.contentHorizontalAlignment = .Center
        
        button.tag = tag
        
        let title: String = String(UnicodeScalar(controls[tag - 1]))
        button.setTitle(title.uppercaseString, forState: .Normal)
        button.titleLabel?.font = UIFont(name: fontName, size: keybuttonHeight * 0.8)
        button.setTitleColor(UIColor(red: 28.0/255, green: 1.0/255, blue: 125.0/255, alpha: 1), forState: UIControlState.Normal)
        button.titleLabel?.textAlignment = .Center
        button.titleEdgeInsets = UIEdgeInsetsMake(keybuttonHeight * 0.2, 0.0, 0.0, 0.0)
        
        button.addTarget(self, action: Selector("keyboardInputMode:"), forControlEvents: .TouchUpInside)
        
        self.controlLayout!.addSubview(button)
    }
    
    func addKeyboardLayout() -> Void {
        
        if (keyboardLayout == nil) {
            keyboardLayout  = UIView(frame: CGRect(x: keybuttonWidth * 4.0, y: 0.0, width: keybuttonWidth * 4.0, height: keybuttonHeight * 5.0))
            
            self.view.addSubview(keyboardLayout!)
        }
        else {
            for view in keyboardLayout!.subviews {
                view.removeFromSuperview()
            }
            
            keyboardLayout?.frame = CGRect(x: keybuttonWidth * 4.0, y: 0.0, width: keybuttonWidth * 4.0, height: keybuttonHeight * 5.0)
        }
        
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        var index = 0
        for keycode in rows[numKeyboardLayout] {
            if index % 4 == 0 {
                x = 0.0
                y = keybuttonHeight * CGFloat(index / 4)
            }
            else {
                x += keybuttonWidth
            }
            
            if keycode != 0x0000 {
                addKeyButton(CGRect(x: x, y: y, width: keybuttonWidth, height: keybuttonHeight), title: String(UnicodeScalar(keycode)), tag: (index + 5))
            }
            
            index++
        }
    }
    
    
    
    func addKeyButton(rect: CGRect, title: String, tag: Int) {
    
        let button = UIButton(type: .Custom) as UIButton
        
        button.frame = rect
        
        button.setBackgroundImage(UIImage(named: "normal.png"), forState:.Normal)
        button.setBackgroundImage(UIImage(named: "pressed.png"), forState:.Highlighted)
        button.contentVerticalAlignment = .Center
        button.contentHorizontalAlignment = .Center
        
        button.tag = tag
        
        button.setTitle(title.uppercaseString, forState: .Normal)
        if numKeyboardLayout == 0 {
            button.contentVerticalAlignment = .Bottom
            button.titleLabel?.font = UIFont(name: fontName, size: keybuttonHeight * 0.8)
            button.setTitleColor(UIColor(red: 28.0/255, green: 1.0/255, blue: 125.0/255, alpha: 1), forState: UIControlState.Normal)
            
            button.titleEdgeInsets = UIEdgeInsetsMake(keybuttonHeight * 0.1, 0.0, 0.0, 0.0)
            
            homeActionButton!.userInteractionEnabled = false
            backActionButton!.userInteractionEnabled = false
        }
        else {
            button.titleLabel?.font = UIFont(name: fontName, size: keybuttonHeight * 0.8)
            button.setTitleColor(UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.0), forState: UIControlState.Normal)
            
            button.setImage(textToImage(title.uppercaseString, inRect: rect), forState:.Normal)
        }
        
        button.addTarget(self, action: Selector("keyPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.keyboardLayout!.addSubview(button)
    }
    
    func textToImage(drawText: NSString, inRect: CGRect)->UIImage {
        // Setup the font specific variables
        let textColor: UIColor = UIColor.blackColor()
        let textFont: UIFont =  UIFont(name: fontName, size: inRect.size.height * 0.6)!
        
        //Setup the image context using the passed image.
        UIGraphicsBeginImageContextWithOptions(inRect.size, false, 0)
        
        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor,
        ]
        
        let textSize = drawText.sizeWithAttributes(textFontAttributes)
        
        let textRect = CGRectMake(inRect.size.width / 2 - textSize.width / 2, inRect.size.height / 2 - textSize.height / 2,
            textSize.width, textSize.height)
        
        drawText.drawInRect(textRect, withAttributes: textFontAttributes)
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
    }

    func deleteKeyPressed(sender: UIButton) {

        if (timer != nil) {
            timer!.invalidate()
            timer = nil
        }
        
        delete()
    }
    
    func deleteKeyDown(sender: UIButton) {

        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("delete"), userInfo: nil, repeats: true)
    }
    
    func delete() {

        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
        
        if previewTextArray.count > 0 {
            previewTextArray.removeAtIndex(previewTextArray.count - 1)
            
            let textFont: UIFont =  UIFont(name: fontName, size: keybuttonHeight * 0.6)!
            let textFontAttributes = [NSFontAttributeName: textFont]
            
            var previewText: String = String("")
            
            let ellipsisText: String = String("...")
            let ellipsisTextSize = ellipsisText.sizeWithAttributes(textFontAttributes)
            
            for (var i = previewTextArray.count; i > 0; i--) {
                previewText = previewText.stringByAppendingString(previewTextArray[i - 1])
                let previewTextSize = previewText.sizeWithAttributes(textFontAttributes)
                
                if (previewTextSize.width + ellipsisTextSize.width + 8 * 2) > inputPreview!.contentSize.width {
                    previewText = previewText.substringToIndex(previewText.endIndex.predecessor())
                    previewText = previewText.stringByAppendingString(ellipsisText)
                    
                    break
                }
                
                if i == 1 {
                    ellipsisMode = false
                }
            }
            
            inputPreview!.text = String(previewText.characters.reverse())
        }
    }
    
    func homeKeyPressed(sender: UIButton) {
        
        if numKeyboardLayout != 0 {
            numKeyboardLayout = sender.tag
            addKeyboardLayout()
            numKeyboardLayout = 0
            
            keyboardInputModeArray.removeAll()
            homeActionButton!.userInteractionEnabled = false
            backActionButton!.userInteractionEnabled = false
        }
    }
    
    func backKeyPressed(sender: UIButton) {
        
        if keyboardInputModeArray.count > 0 {
            numKeyboardLayout = keyboardInputModeArray.last!
            addKeyboardLayout()
            
            keyboardInputModeArray.removeAtIndex(keyboardInputModeArray.count - 1)
        }
        else {
            homeActionButton!.userInteractionEnabled = false
            backActionButton!.userInteractionEnabled = false
        }
    }
    
    func returnKeyPressed(sender: UIButton) {
       
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("\n")
        
        inputPreview!.text = nil
        previewTextArray.removeAll()
        
        previewTextArray.removeAll()
        ellipsisMode = false
    }
    
    func keyPressed(sender: UIButton) {
        
        if numKeyboardLayout == 0 {
            keyboardInputModeArray.append(0)
            
            numKeyboardLayout = sender.tag
            addKeyboardLayout()
            
            homeActionButton!.userInteractionEnabled = true
            backActionButton!.userInteractionEnabled = true
        }
        else {
            let proxy = self.textDocumentProxy as UITextDocumentProxy
            if sender.titleLabel?.text != " " {
                proxy.insertText(sender.titleLabel?.text ?? "")
                
                if numKeyboardLayout > 4 {
                    numKeyboardLayout = 0
                    addKeyboardLayout()
                }
                
                previewTextArray.append((sender.titleLabel?.text)!)

                let textFont: UIFont =  UIFont(name: fontName, size: keybuttonHeight * 0.6)!
                let textFontAttributes = [NSFontAttributeName: textFont]
                
                if ellipsisMode == false {
                    let previewText = inputPreview!.text.stringByAppendingString(sender.titleLabel!.text!)
                    let previewTextSize = previewText.sizeWithAttributes(textFontAttributes)
                    
                    if previewTextSize.width + 8 * 2 > inputPreview!.contentSize.width {
                        ellipsisMode = true
                    }
                }
                
                if ellipsisMode == true {
                    let ellipsisText: String = String("...")
                    let ellipsisTextSize = ellipsisText.sizeWithAttributes(textFontAttributes)
                    
                    var previewText: String = String("")
                    
                    for (var i = previewTextArray.count; i > 0; i--) {
                        previewText = previewText.stringByAppendingString(previewTextArray[i - 1])
                        let previewTextSize = previewText.sizeWithAttributes(textFontAttributes)
                        
                        if (previewTextSize.width + ellipsisTextSize.width + 8 * 2) > inputPreview!.frame.width {
                            previewText = previewText.substringToIndex(previewText.endIndex.predecessor())
                            previewText = previewText.stringByAppendingString(ellipsisText)
                            
                            inputPreview!.text = String(previewText.characters.reverse())
                            break
                        }
                    }
                }
                else {
                    inputPreview!.text = inputPreview!.text.stringByAppendingString(sender.titleLabel!.text!)
                }
            }
        }
    }
    
    func keyboardInputMode(sender: UIButton) {
       
        if numKeyboardLayout != sender.tag {
            keyboardInputModeArray.append(numKeyboardLayout)
            
            numKeyboardLayout = sender.tag
            addKeyboardLayout()
            
            homeActionButton!.userInteractionEnabled = true
            backActionButton!.userInteractionEnabled = true
        }
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
        self.nextKeyButton.setTitleColor(textColor, forState: .Normal)
    }

}