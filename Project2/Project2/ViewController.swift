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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["us","uk","estonia","frace", "germany", "ireland", "italy", "monaco", "russia", "poland", "spain", "nigeria"]
        
        view.backgroundColor = UIColor.lightGray
        
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }


}

