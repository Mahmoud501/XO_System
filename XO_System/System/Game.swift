//
//  Game.swift
//  XO_System
//
//  Created by Mahmoud Zaki on 06/02/2025.
//

import Foundation

enum GameState {
    case none
    case running
    case finished
}

class Game {
    var id: Int = 0
    var board: Board
    private var currentTurn: Int = 0
    private var players: [Player] = []
    private var state: GameState = .none
    private var winningPlayer: Player?
    
    init(board: Board, players: [Player]) {
        self.board = board
        self.players = players
        self.assignGameToPlayer()
        state = .running
    }
    
    var gameState: GameState {
        return state
    }
    
    var currentTurnIndex: Int {
        return currentTurn
    }
    
    var currentTurnPlayer: Player? {
        if players.count - 1 > currentTurn {
            return players[currentTurn]
        }
        return nil
    }
    
    var playerList: [Player] {
        return players
    }
    
    private func changeTurn() {
        if players.count - 1 > currentTurn {
            currentTurn = currentTurn + 1
        }else {
            currentTurn = 0
        }
    }
    
    private func assignGameToPlayer() {
        for player in players {
            player.game = self
        }
    }
    
    func setValueOnBoardAt(accessId: Int, row: Int, column: Int) -> Bool {
        if state == .running {
            if accessId == players[currentTurn].id {
                if let piece = players[currentTurn].selectedPiece {
                    if board.isEmptySquare(row: row, column: column) {
                        if board.updateSquare(with: piece, row: row, column: column) {
                            if getWinner() == nil {
                                changeTurn()
                            }
                            return true
                        }else {
                            return false
                        }
                        
                    }else {
                        print("square not empty")
                        return false
                    }
                }else {
                    print("error play has no piece")
                    return false
                }
            }else{
                print("invaild player")
                return false
            }
        }else {
            print("game is not running")
            return false
        }
    }
    
    
    func getWinner() -> Player? {
        if state != .finished {
            if board.hasSamePieceHorizontal() ||
                board.hasSamePieceVertical() ||
                board.hasSamePieceCrossly() {
                state = .finished
                winningPlayer = players[currentTurn]
                print("winner winner chicken dinner ", winningPlayer?.name ?? "" , " with " , winningPlayer?.selectedPiece?.getData() ?? "")
                return winningPlayer
            }else {
                return nil
            }
        }
        return winningPlayer
    }
    
    
    
}
