//
//  ViewController.swift
//  quizapp
//
//  Created by YilmazC on 24.03.2020.
//  Copyright © 2020 YilmazC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var allQuestion = QuestionBank()
    var answerPressed: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var sorulabel: UILabel!
    @IBOutlet weak var progesslabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var Buttons: UIView!
    
    @IBOutlet weak var buttonss: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sorulabel.text = allQuestion.list[questionNumber].questiontext
    }

    
    
    @IBAction func answerdPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            answerPressed = true
        }else if sender.tag == 2{
            answerPressed = false
        }
        checkAnswer()
        nextQuestion()
      
    }
    
    
    func updateUI() {
        score += 1
        
        scorelabel.text = "Puan: \(score)"
        progesslabel.text = "Soru: \(questionNumber + 1)/17"
        
    }
    
    
    func nextQuestion () {
        if questionNumber < 16 {
        questionNumber += 1
        
        sorulabel.text = allQuestion.list[questionNumber].questiontext
        }else{
            print("Sınav Bitti")
            sorulabel.text = " Sınav bitti"
            Buttons.isHidden = true
            buttonss.isHidden = true
            
            let alert = UIAlertController(title: "Sınava katıldığınız için teşekkürler. Tekrar başlamak için butona basın", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                self.startOver()
            }))
            self.present(alert, animated: true, completion: nil)

            
        }
    }
    
    
    func checkAnswer () {
        if answerPressed == allQuestion.list[questionNumber].answer{
            print("Doğru")
            updateUI()
        }else {
            print("Yanlış")
        }
        
    }
    
    func startOver() {
        Buttons.isHidden = false
        buttonss.isHidden = false
        
        questionNumber = 0
        scorelabel.text = "Puan: \(score)"
        progesslabel.text = "Soru \(questionNumber + 1)/13"
        sorulabel.text = allQuestion.list[questionNumber].questiontext
    }
}


