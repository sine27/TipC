//
//  ViewController.swift
//  TipC
//
//  Created by Shayin Feng on 1/20/16.
//  Copyright © 2016 Shayin Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultDisplay: UILabel!
    @IBOutlet weak var divideDisplay: UITextField!
    @IBOutlet weak var amountDisplay: UITextField!

    
    var divideButton = false
    var amountButton = true
    
    var divide : Double = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func divideTapped(sender: AnyObject) {
        divideButton = true
        amountButton = false
    }
    
    @IBAction func amountTapped(sender: AnyObject) {
        divideButton = false
        amountButton = true
    }
    
    @IBAction func numberTapped(sender: AnyObject) {
        
        let num = sender.currentTitle
        
        if ( amountButton == true ) {
            if ( amountDisplay.text != "" && num == "delete" ) {
                amountDisplay.text = amountDisplay.text!.substringToIndex(amountDisplay.text!.endIndex.predecessor())
                if ( amountDisplay.text == "" ) {
                    amountDisplay.text = "0"
                }
            } else if ( num != "delete" ) {
                if ( amountDisplay.text == "0" ) {
                    amountDisplay.text = ""
                }
                amountDisplay.text = amountDisplay.text! + num!!
            }
        }
        
        else if ( divideButton == true ) {
            if ( num == "." ) {}
            else if ( divideDisplay.text != "" && num == "delete" ) {
                divideDisplay.text =  divideDisplay.text!.substringToIndex( divideDisplay.text!.endIndex.predecessor())
                if ( divideDisplay.text == "" ) {
                    divideDisplay.text = "1"
                }
            } else if ( num != "delete" ) {
                if (  divideDisplay.text == "1" ) {
                     divideDisplay.text = ""
                }
                 divideDisplay.text =  divideDisplay.text! + num!!
            }
        }
    }
    
    @IBAction func percentageButtonTapped(sender: AnyObject) {
        
        let bill : Double = NSNumberFormatter().numberFromString(amountDisplay.text!)!.doubleValue
        divide = NSNumberFormatter().numberFromString( divideDisplay.text!)!.doubleValue
        if ( sender.currentTitle == "15%" ) {
            resultDisplay.text = "\( bill * 1.15 / divide )"
        } else if ( sender.currentTitle == "18%" ) {
            resultDisplay.text = "\( bill * 1.18 / divide )"
        } else if ( sender.currentTitle == "20%" ) {
            resultDisplay.text = "\( bill * 1.20 / divide )"
        }
        
    }

}

