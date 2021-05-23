//
//  InterfaceController.swift
//  rps WatchKit Extension
//
//  Created by J1W on 2021/4/25.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        startUI()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    var robotVictoryCount = 0
    var humanVicotryCount = 0
    @IBOutlet weak var robotSignLabel: WKInterfaceLabel!
    @IBOutlet weak var scoreBoard: WKInterfaceLabel!
    @IBOutlet weak var humanSignLabel: WKInterfaceLabel!
    @IBOutlet weak var scissorsButton: WKInterfaceButton!
    @IBOutlet weak var paperButton: WKInterfaceButton!
    @IBOutlet weak var rockButton: WKInterfaceButton!
    fileprivate func humanSignButtons(hidden: Bool) {
        scissorsButton.setHidden(hidden)
        paperButton.setHidden(hidden)
        rockButton.setHidden(hidden)
    }
    fileprivate func startUI() {
        robotSignLabel.setText("🤖️")
        scoreBoard.setText("\(robotVictoryCount)\n-\n\(humanVicotryCount)")
        humanSignButtons(hidden: false)
        humanSignLabel.setHidden(true)
    }
    fileprivate func resultUI(humanSign: Sign) {
        let robotSign = randomSign()
        robotSignLabel.setText(robotSign.signEmoji)
        switch humanSign.compare(with: robotSign) {
        case .win:
            humanVicotryCount += 1
            scoreBoard.setText(" \n \n+1")
        case .lose:
            robotVictoryCount += 1
            scoreBoard.setText("+1\n \n ")
        case .draw:
            if isPrime(at: (humanVicotryCount)) {
                scoreBoard.setText(" \n♪--O(≧∇≦)O--♪\n ")
            } else {
                scoreBoard.setText(" \n \n ")
            }
        }
        humanSignButtons(hidden: true)
        humanSignLabel.setText(humanSign.signEmoji)
        humanSignLabel.setHidden(false)
    }
    fileprivate func randomSign() -> Sign {
        switch Int.random(in: 0..<3) {
        case 1: return .rock
        case 2: return .paper
        default: return .scissors
        }
    }
    func isPrime(at number: Int) -> Bool {
        var isPrimeNumber = false
        if number < 2 {isPrimeNumber = false}
        else {
            for i in 2...((number/2)+1) {
                if number % i == 0 {isPrimeNumber = false}
                else {isPrimeNumber = true}
            }
        }
        return isPrimeNumber
    }
    @IBAction func scissorsButtonPushed() {
        resultUI(humanSign: .scissors)
    }
    @IBAction func paperButtonPushed() {
        resultUI(humanSign: .paper)
    }
    @IBAction func rockButtonPushed() {
        resultUI(humanSign: .rock)
    }
    @IBAction func labelTapped(_ sender: Any) {
        startUI()
    }
}
