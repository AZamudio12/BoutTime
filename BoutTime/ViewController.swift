//
//  ViewController.swift
//  BoutTime
//
//  Created by Alexander Zamudio on 9/26/17.
//  Copyright © 2017 Alexander Zamudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var downButtonTop: UIButton!
    @IBOutlet weak var downButtonMid: UIButton!
    @IBOutlet weak var downButtonBottom: UIButton!
    @IBOutlet weak var upButtonBottom: UIButton!
    @IBOutlet weak var upButtonMid: UIButton!
    @IBOutlet weak var upButtonTop: UIButton!
    
    @IBOutlet weak var label4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayContent() {
        label1.text = listOfHistoricalYears[0]
        label2.text = listOfHistoricalYears[1]
        label3.text = listOfHistoricalYears[2]
        label4.text = listOfHistoricalYears[3]
    }

    var listOfHistoricalEvents: [String] =
    ["Rio Olympics - 2016",
     "Brazil FIFA World Cup - 2014",
     "Super Bowl V1 - 2016",
     "Giants Win World Series - 2014",
     "Beijing Summer Olympics - 2008",
     "NY Yankees Win World 27th World Series - 2009",
     "South Africa World Cup - 2010",
     "Dallas Mavericks Win 1st NBA Title = 2011",
     "London Olympics - 2012",
     "Oracle Team Wins America's Cup - 2013",
     "Cricket World Cup - 2015"
     
    ]
    
    let listOfHistoricalYears =
    ["1992",
     "1993",
     "1994",
     "1995",
     "1996",
     "1997",
     "1998",
     "1998",
     "2000",
     "2001",
     "2002",
     "2003",
     "2004",
     "2005",
     "2006",
     "2007",
     "2008",
     "2009",
     "2010",
     "2011",
     "2012",
     "2013",
     "2014",
     "2015",
     "2016",
     "2017",
     ]

}

