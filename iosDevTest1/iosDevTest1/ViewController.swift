//
//  ViewController.swift
//  iosDevTest1
//
//  Created by MacBook on 31.08.17.
//  Copyright © 2017 Ozsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0;
    //connect new label from main storyboard
    @IBOutlet weak var Label1: UILabel!
    //var lastLabel1Text= Label1.text;
    //connect new button from main storybord
    @IBOutlet weak var Button1: UIButton!
    //
    @IBAction func CountTapsOnButton1(_ sender: Any) {
        counter+=1;
        //Label1.text = lastLabel1Text.appending(" \(counter)");
        Label1.text = "Taped  \(counter) times";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

