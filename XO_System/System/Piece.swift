//
//  Peice.swift
//  XO_System
//
//  Created by Mahmoud Zaki on 06/02/2025.
//

import Foundation

class Piece {
    enum PieceType {
        case text
    }
    var id: Int = 0
    private var data: Any = ""
    var type: PieceType = .text

    init() {
    }

    func setData(_ data: Any, type: PieceType) {
        self.data = data
        self.type = type
    }

    func getData()-> Any {
        return data
    }
}
