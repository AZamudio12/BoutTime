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
    @IBOutlet weak var playAgainBtn: UIButton!
    
    var indexOfSelectedQuestion: Int = 0
    var randomNumArray = [Int]()
    
    let numOfRounds = 6
    var roundsPlayed = 0
    let contentPerRound = 4
    var correctRound = 0 
    
    var contentForRoundArray = [String]()
    
    var timer = Timer()
    var counter = 10
    
    
    var label1Dictionary = [String : String]()
    var label2Dictionary = [String : String]()
    
    var label3Dictionary = [String : String]()
    var label4Dictionary = [String : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayContent()
        
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
            //CALL NEXT ROUND HERE
            timer.invalidate()

            downButtonTop.isEnabled = false
            downButtonMid.isEnabled = false
            downButtonBottom.isEnabled = false
            upButtonBottom.isEnabled = false
            upButtonMid.isEnabled = false
            upButtonTop.isEnabled = false
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
            
            downButtonTop.isEnabled = false
            downButtonMid.isEnabled = false
            downButtonBottom.isEnabled = false
            upButtonBottom.isEnabled = false
            upButtonMid.isEnabled = false
            upButtonTop.isEnabled = false
            
        } else {
            if counter < 10 {
                timerLabel.text = "0:0\(counter)"
            } else {
                timerLabel.text = "0:\(counter)"
                
            }
            
        }
        
        
    }

    
    func randomNumberFunction() -> Int {
        
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        
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

        label1.isHidden = false
        label2.isHidden = false
        label3.isHidden = false
        label4.isHidden = false
        downButtonTop.isHidden = false
        downButtonMid.isHidden = false
        downButtonBottom.isHidden = false
        upButtonBottom.isHidden = false
        upButtonMid.isHidden = false
        upButtonTop.isHidden = false
        shakeLabel.isHidden = false
        timerLabel.isHidden = false
        
        nextRoundFailBtn.isHidden = true
        nextRoundSuccessBtn.isHidden = true
        yourScoreLabel.isHidden = true
        finalScoreLabel.isHidden = true
        playAgainBtn.isHidden = true
        
        downButtonTop.isEnabled = true
        downButtonMid.isEnabled = true
        downButtonBottom.isEnabled = true
        upButtonBottom.isEnabled = true
        upButtonMid.isEnabled = true
        upButtonTop.isEnabled = true

        counter = 10
        timerLabel.text = "1:00"
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        print("\(randomNumber1)")
        print("\(randomNumber2)")

        print("\(randomNumber3)")

        print("\(randomNumber4)")
        
        print("\(randomNumArray)")

        shakeLabel.text = "Shake to Complete"
        
        label1Dictionary = events[randomNumber1]
        label2Dictionary = events[randomNumber2]

        label3Dictionary = events[randomNumber3]
        label4Dictionary = events[randomNumber4]

        
        
        
        label1.text = label1Dictionary["Event"]
        label2.text = label2Dictionary["Event"]
        label3.text = label3Dictionary["Event"]
        label4.text = label4Dictionary["Event"]
    }
    
    @IBAction func moveText(_ sender: UIButton) {
    //Need to fix force unwrapping here
        
        var tempText = ""
        var tempDictionary = [String : String]()
        if (sender === downButtonTop) {
            tempText = label1.text!
            label1.text = label2.text
            label2.text = tempText
            
            tempDictionary = label1Dictionary
            label1Dictionary = label2Dictionary
            label2Dictionary = tempDictionary
            
        }
        
        if (sender === downButtonMid) {
            tempText = label2.text!
            label2.text = label3.text
            label3.text = tempText
            
            tempDictionary = label2Dictionary
            label2Dictionary = label3Dictionary
            label3Dictionary = tempDictionary
        }
        
        if (sender === downButtonBottom) {
            tempText = label3.text!
            label3.text = label4.text
            label4.text = tempText
            
            tempDictionary = label3Dictionary
            label3Dictionary = label4Dictionary
            label4Dictionary = tempDictionary
        }
        
        if (sender === upButtonBottom) {
            tempText = label4.text!
            label4.text = label3.text
            label3.text = tempText
            
            tempDictionary = label4Dictionary
            label4Dictionary = label3Dictionary
            label3Dictionary = tempDictionary
        }
        
        if (sender === upButtonMid) {
            tempText = label3.text!
            label3.text = label2.text
            label2.text = tempText
            
            tempDictionary = label3Dictionary
            label3Dictionary = label2Dictionary
            label2Dictionary = tempDictionary
            
        }
        
        if (sender === upButtonTop) {
            tempText = label2.text!
            label2.text = label1.text
            label1.text = tempText
            
            tempDictionary = label2Dictionary
            label2Dictionary = label1Dictionary
            label1Dictionary = tempDictionary
        }
    
    }
    
    @IBAction func nextRoundButtonAction() {
        nextRound()
    }
    
    
    func checkEventsOrderedCorrectly() -> Bool {
        //if events are ordered correctly return true
        roundsPlayed += 1
        
        if (label1Dictionary["Year"]! < label2Dictionary["Year"]! && label2Dictionary["Year"]! < label3Dictionary["Year"]! && label3Dictionary["Year"]! < label4Dictionary["Year"]!) {
            correctRound += 1
            return true
        } else {
            return false
        }
        
    }
    
    func nextRound() {
        if roundsPlayed == numOfRounds {
            displayScore()
            roundsPlayed = 0
            correctRound = 0
        } else {
            randomNumArray.removeAll()
            displayContent()
        }
        
    }
    
    func displayScore() {
        label1.isHidden = true
        label2.isHidden = true
        label3.isHidden = true
        label4.isHidden = true
        downButtonTop.isHidden = true
        downButtonMid.isHidden = true
        downButtonBottom.isHidden = true
        upButtonBottom.isHidden = true
        upButtonMid.isHidden = true
        upButtonTop.isHidden = true
        shakeLabel.isHidden = true
        timerLabel.isHidden = true
        nextRoundSuccessBtn.isHidden = true
        nextRoundFailBtn.isHidden = true
        
        finalScoreLabel.text = " \(correctRound)/\(numOfRounds)"
        finalScoreLabel.isHidden = false
        playAgainBtn.isHidden = false
        yourScoreLabel.isHidden = false
    }

    @IBAction func playAgain() {
        playAgainBtn.isHidden = true
        yourScoreLabel.isHidden = true
        finalScoreLabel.isHidden = true
        
        randomNumArray.removeAll()
        displayContent()
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
    
    let events: [[String : String]] = [
        ["Event": "Rio Olympics 16", "Year": "2016"],
        ["Event": "Brazil FIFA World Cup 14", "Year": "2014"],
        ["Event": "Giants Win World Series 17", "Year": "2017"],
        ["Event": "Cricket World Cup 15", "Year": "2015"],
        ["Event": "Oracle Team Wins America's Cup 13", "Year": "2013"],
        ["Event": "Dallas Mavericks Win 1st NBA Title 11", "Year": "2011"],
        ["Event": "South Africa World Cup 10", "Year": "2010"],
        ["Event": "NY Yankees Win World 27th World Series 9", "Year": "2009"],
        ["Event": "Beijing Summer Olympics 8", "Year": "2008"]
            
        
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

