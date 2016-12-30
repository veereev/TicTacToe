//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by VEERASEKHAR ADDEPALLI on 28/12/16.
//  Copyright © 2016 VEERASEKHAR ADDEPALLI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 // 1 is noughts and 2 is crosses
    
    var activeGame = true
    
    @IBOutlet var playAgainButton: UIButton!
    @IBOutlet var winnerLabel: UILabel!
    @IBAction func playAgain(_ sender: Any) {
        
        activeGame = true
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        
        //Loop through all the buttons to clear all the images
        
        
        
        for i in 1...9 {
            
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: .normal)
            }
            
            winnerLabel.isHidden = true
            playAgainButton.isHidden = true
            
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y - 500)
            
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y - 500)
            
            

            
        
        }
        
    }
    var gameState = [0,0,0,0,0,0,0,0,0]//to keep track of the game state
    // 0 represents empty, 1 represents noughts and 2 as crosses and this is why I used numbers for activePlayer variable
    // instead of a regular boolean value
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8], [0,4,8], [2, 4, 6]]
    //Positions of winnning comibinations
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
       
        //Connected all buttons to this outlet function. We give tags to identify a button
        
        let activePosition = sender.tag - 1 //as we have set the tags starting value from 1
        
        if gameState[activePosition] == 0 && activeGame
        {
             gameState[activePosition] = activePlayer
            if activePlayer == 1
            {
                sender.setImage(UIImage(named:"nought.png"), for: .normal)
                activePlayer = 2
               
            }
            else
            {
                sender.setImage(UIImage(named:"cross.png"), for: .normal)
                activePlayer = 1
               
            }
            
            for combination in winningCombinations
            {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                
                // We have a win
                
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "Noughts have won"
                    }
                    else
                    {
                        winnerLabel.text = "Crosses have won"
                    }
                    UIView.animate(withDuration: 1, animations: {
                    
                    self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y + 500)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y + 500)
                        
                    
                    })
                }
            }
        }
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y - 500)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y - 500)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

