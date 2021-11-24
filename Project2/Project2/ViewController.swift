//
//  ViewController.swift
//  Project2
//
//  Created by Hyago Henrique on 23/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var answers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        view.backgroundColor = UIColor.lightGray
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        if answers >= 10 {
            let acOver = UIAlertController(title: "Game Over", message: "Your score \(score)", preferredStyle: .alert)
            acOver.addAction(UIAlertAction(title: "Restart Game", style: .default, handler: askQuestion))
            present(acOver, animated: true)
            score = 0
            answers = 0
            correctAnswer = 0
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title =  "Guess the flag of : " + countries[correctAnswer].uppercased() + " | Your Score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            answers += 1
            message = "You score is \(score)"
        } else {
            title = "Wrong"
            score -= 1
            answers += 1
            message = "You choose flag of: \(countries[sender.tag].uppercased()) | You score is \(score)"
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

