//
//  ContentView.swift
//  XO_System
//
//  Created by Mahmoud Zaki on 06/02/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var testGame: TestGame = TestGame()
    
    var body: some View {
        VStack {
            Button {
                if testGame.player1?.selectSquare(row: 0, column: 1) == true {
                    testGame.game?.board.printBoard()
                }
                if testGame.player2?.selectSquare(row: 0, column: 0) == true {
                    testGame.game?.board.printBoard()
                }
                if testGame.player1?.selectSquare(row: 0, column: 2) == true {
                    testGame.game?.board.printBoard()
                }
                if testGame.player2?.selectSquare(row: 1, column: 0) == true {
                    testGame.game?.board.printBoard()
                }
                if testGame.player1?.selectSquare(row: 2, column: 2) == true {
                    testGame.game?.board.printBoard()
                }
                if testGame.player2?.selectSquare(row: 2, column: 0) == true {
                    testGame.game?.board.printBoard()
                }
            } label: {
                Text("Test")
            }
            
            Button {
                testGame.game?.board.printBoard()
                print(testGame.game?.getWinner()?.name ?? "")
            } label: {
                Text("Test2")
            }
            
        }
    }
    
    
}

#Preview {
    ContentView()
}
