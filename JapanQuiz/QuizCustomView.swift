//
//  QuizCustomView.swift
//  JapanQuiz
//
//  Created by Scott Kvitberg on 10/06/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

class QuizCustomView: UIView {

    var view:UIView!
    var test:String?
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBAction func answerButtonHandler(sender: UIButton) {
    }
    
    @IBAction func nextButtonHandler(sender: UIButton) {
    }
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        setup()
    }
    
    
    func setup()
    {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        addSubview(view)
    }
    
    
    func loadViewFromNib() -> UIView
    {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "QuizCustomView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    

}
