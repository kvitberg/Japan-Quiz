//
//  HiraganaViewController.swift
//  JapanQuiz
//
//  Created by Scott  on 11/03/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

class HiraganaViewController: UIViewController {
    @IBOutlet var hiraganaGameModeButtons: [UIButton]!
   
    @IBAction func hiraganaGameModeButtonHandler(sender: UIButton) {
        for button in hiraganaGameModeButtons{
            if sender != button {
                button.alpha = 0.7
            } else {
                button.alpha = 1.0
                hiraganaGameMode = button.tag
            }
        }

    }
    @IBAction func hiraganaPlayButtonHandler(sender: UIButton) {
        var vc: UIViewController?
        switch hiraganaGameMode {
        case 0:
            //Multiple Choice quiz
            vc = storyboard?.instantiateViewControllerWithIdentifier("hiraganaMonographsViewController") as! HiraganaMonographsViewController
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
    var hiraganaGameMode = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        for (idx, button) in hiraganaGameModeButtons.enumerate(){
            button.tag = idx
            if button.tag != 0 {
                button.alpha = 0.7
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
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
