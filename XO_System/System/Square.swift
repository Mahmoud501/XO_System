//
//  Square.swift
//  XO_System
//
//  Created by Mahmoud Zaki on 06/02/2025.
//

import Foundation


class Square {
    var id: Int = 0
    var pointX: Int = 0
    var pointY: Int = 0
    private var piece: Piece?

    func holdPiece(_ piece: Piece?) {
        self.piece = piece
    }

    func getPiece() -> Piece? {
        return piece
    }
}
