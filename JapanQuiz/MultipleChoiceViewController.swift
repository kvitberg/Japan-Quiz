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
    
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBAction func AnswerButtonHandler(sender: UIButton) {
        if sender.titleLabel!.text == correctAnswer{
            print("Correct")
        }else{
            sender.backgroundColor = UIColor.alizarin()
            print("Wrong")
        }
        for button in answerButtons {
            button.enabled = false
            if button.titleLabel!.text == correctAnswer {
                button.backgroundColor = UIColor.turquoise()
            }
        }
        cardButton.enabled = true
        
    }
    @IBOutlet weak var cardButton: UIButton!
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
    
    var questionIdx = 0
    var answers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cardButton.enabled = false
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
