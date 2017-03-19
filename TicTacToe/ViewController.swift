//
//  ViewController.swift
//  TicTacToe
//
//  Created by Monique Brauer on 19/03/2017.
//  Copyright © 2017 MokitaLE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonA0: UIButton!
    @IBOutlet weak var buttonA1: UIButton!
    @IBOutlet weak var buttonA2: UIButton!
    @IBOutlet weak var buttonB0: UIButton!
    @IBOutlet weak var buttonB1: UIButton!
    @IBOutlet weak var buttonB2: UIButton!
    @IBOutlet weak var buttonC0: UIButton!
    @IBOutlet weak var buttonC1: UIButton!
    @IBOutlet weak var buttonC2: UIButton!
    @IBOutlet weak var newGameButton: UIButton!

    var currentPlayer: Player = .one
    var gameOver = false

    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
    }

    func updateTitle () {
        title = "It's your turn player: \(currentPlayer.name)"
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard !gameOver else { return }
        guard sender.image(for: .normal) == nil else { return }

        sender.setImage(currentPlayer.card, for: .normal)
        sender.tintColor = currentPlayer.cardColour
        sender.tag = currentPlayer.rawValue
        if let winner = checkWinner() {
            presentWinner(player: winner)
        }

        else if (checkDraw()) {
            presentWinner(player: nil)
        }
        else {
            currentPlayer.next()
            updateTitle()
        }
    }


    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        newGame()
    }

    func newGame() {
        gameOver = false
        newGameButton.isHidden = true

        currentPlayer = .one
        updateTitle()

        buttonA0.tag = 0
        buttonA0.setImage(nil, for: .normal)

        buttonA1.tag = 0
        buttonA1.setImage(nil, for: .normal)

        buttonA2.tag = 0
        buttonA2.setImage(nil, for: .normal)

        buttonB0.tag = 0
        buttonB0.setImage(nil, for: .normal)

        buttonB1.tag = 0
        buttonB1.setImage(nil, for: .normal)

        buttonB2.tag = 0
        buttonB2.setImage(nil, for: .normal)

        buttonC0.tag = 0
        buttonC0.setImage(nil, for: .normal)

        buttonC1.tag = 0
        buttonC1.setImage(nil, for: .normal)
        
        buttonC2.tag = 0
        buttonC2.setImage(nil, for: .normal)

    }

    func checkWinner() -> Player? {

        // horizontal
        if buttonA0.tag != 0 && buttonA0.tag == buttonA1.tag && buttonA1.tag == buttonA2.tag {
            return Player(rawValue: buttonA0.tag)
        }

        if buttonB0.tag != 0 && buttonB0.tag == buttonB1.tag && buttonB1.tag == buttonB2.tag {
            return Player(rawValue: buttonB0.tag)
        }

        if buttonC0.tag != 0 && buttonC0.tag == buttonC1.tag && buttonC1.tag == buttonC2.tag {
            return Player(rawValue: buttonC0.tag)
        }


        // vertical
        if buttonA0.tag != 0 && buttonA0.tag == buttonB0.tag && buttonB0.tag == buttonC0.tag {
            return Player(rawValue: buttonA0.tag)
        }

        if buttonA1.tag != 0 && buttonA1.tag == buttonB1.tag && buttonB1.tag == buttonC1.tag {
            return Player(rawValue: buttonA1.tag)
        }

        if buttonA2.tag != 0 && buttonA2.tag == buttonB2.tag && buttonB2.tag == buttonC2.tag {
            return Player(rawValue: buttonA2.tag)
        }

        // diagonal
        if buttonA0.tag != 0 && buttonA0.tag == buttonB1.tag && buttonB1.tag == buttonC2.tag {
            return Player(rawValue: buttonA0.tag)
        }

        if buttonA2.tag != 0 && buttonA2.tag == buttonB1.tag && buttonB1.tag == buttonC0.tag {
            return Player(rawValue: buttonA2.tag)
        }

        return nil
    }

    func checkDraw() -> Bool {
        return buttonA0.tag != 0 && buttonA1.tag != 0 && buttonA2.tag != 0 && buttonB0.tag != 0 && buttonB1.tag != 0 && buttonB2.tag != 0 && buttonC0.tag != 0 && buttonC1.tag != 0 && buttonC2.tag != 0
    }


    func presentWinner(player: Player?) {
        self.title = "Game Over"
        gameOver = true

        var title = "Draw"
        var message = "Try again!"

        if let winner = player {
            title = "We have a winner"
            message = "Player \(winner.name)"
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.newGameButton.isHidden = false
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}






