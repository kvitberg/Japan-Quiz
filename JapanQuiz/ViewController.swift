//
//  ViewController.swift
//  JapanQuiz
//
//  Created by Scott  on 11/03/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadQuizData()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        let score = NSUserDefaults.standardUserDefaults().integerForKey("score")
        let highscore = NSUserDefaults.standardUserDefaults().integerForKey("highscore")
        
        scoreLabel.text = "Score: \(score)"
        highscoreLabel.text = "Highscore: \(highscore)"
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadQuizData(){
        //Mulitple Choice Data
        let pathMC = NSBundle.mainBundle().pathForResource("MultipleChoice", ofType: "plist")
        let dictMC = NSDictionary(contentsOfFile: pathMC!)
        mcArray = dictMC!["Questions"]!.mutableCopy() as? Array
        
        print(mcArray)
        
        
    }

}

