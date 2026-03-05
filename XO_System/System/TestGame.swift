//
//  TestGame.swift
//  XO_System
//
//  Created by Mahmoud Zaki on 06/02/2025.
//


class TestGame {
    
    var game: Game?
    var player1: Player?
    var player2: Player?
    
    init() {
        setup()
    }
    
    func setup() {
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //Player Piece X
        let piece1 = Piece()
        piece1.id = 1
        piece1.setData("X", type: .text)
        //Player 1
        let player1 = Player(piece: piece1)
        player1.id = 1
        player1.name = "Player 1"
        self.player1 = player1
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //Player Piece O
        let piece2 = Piece()
        piece2.id = 2
        piece2.setData("O", type: .text)
        //Player 2
        let player2 = Player(piece: piece2)
        player2.id = 2
        player2.name = "Player 2"
        self.player2 = player2
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        let board = Board(rows: 3, columns: 3)
        let game = Game(board: board, players: [player1, player2])
        self.game = game
    }
    
}
