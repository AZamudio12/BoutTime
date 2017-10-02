//
//  ViewController.swift
//  BoutTime
//
//  Created by Alexander Zamudio on 9/26/17.
//  Copyright © 2017 Alexander Zamudio. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var downButtonTop: UIButton!
    @IBOutlet weak var downButtonMid: UIButton!
    @IBOutlet weak var downButtonBottom: UIButton!
    @IBOutlet weak var upButtonBottom: UIButton!
    @IBOutlet weak var upButtonMid: UIButton!
    @IBOutlet weak var upButtonTop: UIButton!
    @IBOutlet weak var shakeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var nextRoundSuccessBtn: UIButton!
    @IBOutlet weak var nextRoundFailBtn: UIButton!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var yourScoreLabel: UILabel!
    
    var indexOfSelectedQuestion: Int = 0
    var randomNumArray = [Int]()
    
    let numOfRounds = 6
    var roundsPlayed = 0
    let contentPerRound = 4
    
    var contentForRoundArray = [String]()
    
    var timer = Timer()
    var counter = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayContent()
        timerLabel.text = "1:00"
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
    }

    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            shakeLabel.text = "Tap events to learn more"
            if checkEventsOrderedCorrectly() == true {
                nextRoundSuccessBtn.isHidden = false
            } else {
                nextRoundFailBtn.isHidden = false
            }
            print("\(checkEventsOrderedCorrectly())")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCounter() {
        counter -= 1
        
        if counter < 0 {
            shakeLabel.text = "Tap events to learn more"
            if checkEventsOrderedCorrectly() == true {
                nextRoundSuccessBtn.isHidden = false
            } else {
                nextRoundFailBtn.isHidden = false
            }
            timer.invalidate()
            
            print("\(checkEventsOrderedCorrectly())")
            
        } else {
            if counter < 10 {
                timerLabel.text = "0:0\(counter)"
            } else {
                timerLabel.text = "0:\(counter)"
                
            }
            
        }
        
        
    }

    
    func randomNumberFunction() -> Int {
        
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: listOfHistoricalYears.count)
        
        //setup a random Num array to keep track of previous generated random numbers if they have not already been selected then the question is displaed
        //if they have been selected then the method is called again.
        
        if !randomNumArray.contains(indexOfSelectedQuestion) {
            
            randomNumArray.append(indexOfSelectedQuestion)
            return indexOfSelectedQuestion
        } else {
            return randomNumberFunction()
        }
        
    }
    
    func displayContent() {
        let randomNumber1 = randomNumberFunction()
        let randomNumber2 = randomNumberFunction()
        let randomNumber3 = randomNumberFunction()
        let randomNumber4 = randomNumberFunction()

        nextRoundFailBtn.isHidden = true
        nextRoundSuccessBtn.isHidden = true

        
        print("\(randomNumber1)")
        print("\(randomNumber2)")

        print("\(randomNumber3)")

        print("\(randomNumber4)")
        
        print("\(randomNumArray)")

        
        label1.text = listOfHistoricalYears[randomNumber1]
        label2.text = listOfHistoricalYears[randomNumber2]
        label3.text = listOfHistoricalYears[randomNumber3]
        label4.text = listOfHistoricalYears[randomNumber4]
    }
    
    @IBAction func moveText(_ sender: UIButton) {
    //Need to fix force unwrapping here
        
        var tempText = ""
        if (sender === downButtonTop) {
            tempText = label1.text!
            label1.text = label2.text
            label2.text = tempText
        }
        
        if (sender === downButtonMid) {
            tempText = label2.text!
            label2.text = label3.text
            label3.text = tempText
        }
        
        if (sender === downButtonBottom) {
            tempText = label3.text!
            label3.text = label4.text
            label4.text = tempText
        }
        
        if (sender === upButtonBottom) {
            tempText = label4.text!
            label4.text = label3.text
            label3.text = tempText
        }
        
        if (sender === upButtonMid) {
            tempText = label3.text!
            label3.text = label2.text
            label2.text = tempText
        }
        
        if (sender === upButtonTop) {
            tempText = label2.text!
            label2.text = label1.text
            label1.text = tempText
        }
    
    }
    
    func checkEventsOrderedCorrectly() -> Bool {
        //if events are ordered correctly return true
        roundsPlayed += 1
        
        if (label1.text! < label2.text! && label2.text! < label3.text! && label3.text! < label4.text!) {
            return true
        } else {
            return false
        }
        
    }
    
    func nextRound() {
        if roundsPlayed == numOfRounds {
            print("numRounds")
        }
        
    }
    
    func displayAnswers() {
        
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

