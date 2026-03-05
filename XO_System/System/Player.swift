//
//  Player.swift
//  XO_System
//
//  Created by Mahmoud Zaki on 06/02/2025.
//

import Foundation

class Player {
    var id: Int = 0
    var name: String = ""
    var selectedPiece: Piece?
    weak var game: Game?
    
    init(piece: Piece) {
        self.selectedPiece = piece
    }    
    
    @discardableResult
    func selectSquare(row: Int, column: Int) -> Bool {
        if let game = game {
            return game.setValueOnBoardAt(accessId: self.id, row: row, column: column)
        }else {
            print("error not game assign")
            return false
        }
    }
    
}
