//
//  ViewController.swift
//  RPS
//
//  Created by Park JooHyun on 2022/03/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appSignLabel: UILabel!
    @IBOutlet weak var gameStateLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeByGameState(state: .start)
    }

    @IBAction func tapRock(_ sender: UIButton) {
        play(mySign: .rock)
    }
    
    @IBAction func tapPaper(_ sender: UIButton) {
        play(mySign: .paper)
    }
    
    @IBAction func tapScissors(_ sender: UIButton) {
        play(mySign: .scissiors)
    }
    
    @IBAction func tapPlayAgain(_ sender: UIButton) {
        changeByGameState(state: .start)
    }
    
    func changeByGameState(state: GameState) {
        var stateText: String
        var color: UIColor
        
        switch state {
        case .start:
            stateText = "Start!"
            color = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
            
            appSignLabel.text = "🤖"
            
            playAgainButton.isHidden = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
            
        case .win:
            stateText = "You Win!"
            color = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        case .lose:
            stateText = "You Lose.."
            color = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        case .draw:
            stateText = "Draw!"
            color = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        }
        
        gameStateLabel.text = stateText
        view.backgroundColor = color
    }
    
    func play(mySign: Sign) {
        let computerSign = randomSign()
        let state = mySign.compareSign(opponent: computerSign)
        changeByGameState(state: state)
        appSignLabel.text = computerSign.emoji
        
        switch mySign {
        case .rock:
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .scissiors:
            rockButton.isHidden = true
            paperButton.isHidden = true
        }
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        playAgainButton.isHidden = false
    }
}

