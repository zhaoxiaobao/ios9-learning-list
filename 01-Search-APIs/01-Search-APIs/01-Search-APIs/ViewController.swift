//
//  ViewController.swift
//  01-Search-APIs
//
//  Created by zhaoyuan on 16/2/27.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var person: Person!

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text=person.name;
        img.image = person.image

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

