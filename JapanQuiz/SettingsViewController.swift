//
//  SettingsViewController.swift
//  JapanQuiz
//
//  Created by Scott  on 11/03/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

//Main menu story board

class SettingsViewController: UIViewController {

    @IBOutlet var gameModeButtons: [UIButton]!
    
    @IBAction func gameModeButtonHandler(sender: UIButton) {
        for button in gameModeButtons{
            if sender != button {
                button.alpha = 0.7
            } else {
                button.alpha = 1.0
                gameMode = button.tag
            }
        }
    }
    
    @IBAction func playButtonHandler(sender: UIButton) {
        var vc: UIViewController?
        switch gameMode {
        case 0:
            //Multiple Choice quiz
            vc = storyboard?.instantiateViewControllerWithIdentifier("multipleChoiceViewController") as! MultipleChoiceViewController
            break
        case 1:
            //Hiragana quiz
            vc = storyboard?.instantiateViewControllerWithIdentifier("hiraganaViewController") as! HiraganaViewController
            break
        case 2:
            //Katakana quiz
            vc = storyboard?.instantiateViewControllerWithIdentifier("inputViewController") as! InputViewController
            break
        case 3:
            //Kanji quiz
            vc = storyboard?.instantiateViewControllerWithIdentifier("imageViewController") as! ImageViewController
            break
        default:
            break
        
        }
        if vc != nil{
            navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    var gameMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for (idx, button) in gameModeButtons.enumerate(){
            button.tag = idx
            if button.tag != 0 {
                button.alpha = 0.7
            }
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }

}
