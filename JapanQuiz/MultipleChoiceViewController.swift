//
//  MultipleChoiceViewController.swift
//  JapanQuiz
//
//  Created by Scott  on 11/03/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBOutlet weak var cardButton: UIButton!
    
    @IBAction func AnswerButtonHandler(sender: UIButton) {
        timer.invalidate()
        if sender.titleLabel!.text == correctAnswer{
            print("Correct")
            currentScore++
            cardButton.enabled = true
        }else{
            sender.backgroundColor = UIColor.alizarin()
            print("Wrong")
            showAlert(false)
        }
        for button in answerButtons {
            button.enabled = false
            if button.titleLabel!.text == correctAnswer {
                button.backgroundColor = UIColor.turquoise()
            }
        }
        
        
    }
    
    @IBAction func cardButtonHandler(sender: UIButton) {
        cardButton.enabled = true
        if questionIdx < mcArray!.count - 1 {
            questionIdx++
        }else{
            questionIdx = 0
        }
        nextQuestion()
        
    }
    var correctAnswer: String?
    var question: String?
    var timer = NSTimer()
    var questionIdx = 0
    var answers = [String]()
    var currentScore = 0
    var highscore = NSUserDefaults.standardUserDefaults().integerForKey("highscore")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        progressView.transform = CGAffineTransformScale(progressView.transform, 1, 10)
        
        cardButton.enabled = false
        
        mcArray!.shuffle()
        nextQuestion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuestion(){
        let currentQuestion = mcArray![questionIdx]
        
        answers = currentQuestion["Answers"] as! [String]
        correctAnswer = currentQuestion["CorrectAnswer"] as? String
        question = currentQuestion["Question"] as? String
        
        titlesForButtons()
    
    }
    
    
    func titlesForButtons(){
    
        for (idx, button) in answerButtons.enumerate() {
            button.titleLabel!.lineBreakMode = .ByWordWrapping
            button.setTitle(answers[idx], forState: .Normal)
            button.enabled = true
            button.backgroundColor = UIColor.clearColor()
        }
        questionLabel.text = question
        startTimer()
    }
    func startTimer(){
        progressView.progress = 1.0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target:self, selector: "updateProgressView", userInfo: nil, repeats: true)
        
    }
    
    func updateProgressView(){
    
        progressView.progress -= 0.01 / 30
        if progressView.progress <= 0 {
            outOfTime()
        
        }
    
    }
    func outOfTime(){
        timer.invalidate()
        showAlert(true)
        disableButtons()
    }
    
    
    func disableButtons(){
        for buttons in answerButtons{
            buttons.enabled = false
            
        }
    }
    
    func showAlert(slow: Bool){
        if currentScore > highscore{
            highscore = currentScore
            NSUserDefaults.standardUserDefaults().setInteger(highscore, forKey: "highscore")
            
        }
        NSUserDefaults.standardUserDefaults().setInteger(currentScore, forKey: "score")
        
        var title: String?
        if slow{
            title = "Too slow"
        } else{
            title = "Wrong answer"
        }
        
        
        let alertcontroller = UIAlertController(title: title, message: "Score: \(currentScore) \n Highscore: \(highscore)", preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "Ok", style: .Default, handler: {(alert:UIAlertAction!) in
            self.backToMenu()
        })
        
        alertcontroller.addAction(ok)
        self.presentViewController(alertcontroller, animated: true, completion: nil)
    }
    
    func backToMenu(){
        navigationController?.popToRootViewControllerAnimated(true)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
