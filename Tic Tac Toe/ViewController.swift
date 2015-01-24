//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Akkshay Khoslaa on 12/25/14.
//  Copyright (c) 2014 Akkshay Khoslaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var winner = 0
    var goNumber = 1
    var gameState = [0,0,0,0,0,0,0,0,0] // 0 means empty, 1 is a cicle, and 2 is an x
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var playAgainButton: UILabel!
    @IBOutlet weak var label: UILabel!

    @IBAction func playAgain(sender: AnyObject) {
        goNumber = 1
        
        winner = 0
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        
        playAgainButton.alpha = 0
        
        var button:UIButton
        
        for var i = 0; i < 9; i++ {
            
            button = view.viewWithTag(i) as UIButton
            
            button.setImage(nil, forState: .Normal)
        }
    }
        @IBAction func buttonPressed(sender: AnyObject) {
        if (gameState[sender.tag]==0 && winner == 0){
            var image = UIImage()
        if goNumber%2 == 0 {
            image = UIImage(named: "x.gif")!
            sender.setImage(image, forState: .Normal)
            gameState[sender.tag] = 2
        } else {
            image = UIImage(named: "circle.jpg")!
            sender.setImage(image, forState: .Normal)
            gameState[sender.tag] = 1
        }
        
            for combination in winningCombinations {
                if (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[0]] == gameState[combination[2]]) {
                    
                    winner = gameState[combination[0]]
                }
            }
            if (winner != 0) {
                if (winner == 1){
                    label.text = "Circles has won!"
                    
                } else {
                    label.text = "Crosses has won!"
                }
                
                UIView.animateWithDuration(1, animations: {
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                    
                })
                self.playAgainButton.alpha = 1
            }
            
            goNumber = goNumber + 1
            sender.setImage(image, forState: .Normal)
    }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        
        playAgainButton.alpha = 0
    }

}

