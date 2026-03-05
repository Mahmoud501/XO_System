//
//  System.swift
//  XO_System
//
//  Created by Mahmoud Zaki on 06/02/2025.
//


class Board {
    var id: Int = 0
    var name: String = ""
    private var numOfRows: Int = 0
    private var numOfColumns: Int = 0
    var squares: [[Square]] = []

    init(rows: Int, columns: Int) {
        self.numOfRows = rows
        self.numOfColumns = columns
        setup()
    }

    private func setup() {
        if numOfRows == 1 || numOfColumns == 1 {
            print("can't create board with dimantions 1 X 1")
            //assertionFailure("can't create board with dimantions 1 X 1")            
        }
        if numOfRows != numOfColumns {
            print("can't create board with dimantions rows != columns")
            //assertionFailure("can't create board with dimantions rows != columns")
        }
        for i in 0..<numOfRows {
            var squaresOfRow: [Square] = []
            for j in 0..<numOfColumns {
                let square = Square()
                square.id = (i + 1) * (j + 1)
                square.pointX = i
                square.pointY = j
                squaresOfRow.append(square)
            }
            squares.append(squaresOfRow)
        }
    }
    
    func isEmptySquare(row: Int, column: Int) -> Bool {
        if numOfRows > row && numOfColumns > column {
            if squares[row][column].getPiece()?.id == nil {
                return true
            }
            return false
        }else {
            print("wrong coordinate row | columns ", row , " , ", column )
            return false
        }
    }
    
    @discardableResult
    func updateSquare(with: Piece, row: Int, column: Int) -> Bool {
        if numOfRows > row && numOfColumns > column {
            squares[row][column].holdPiece(with)
            return true
        }else {
            print("wrong coordinate row | columns ", row , " , ", column )
            return false
        }
    }

    func hasSamePieceHorizontal() -> Bool {
        for i in 0..<numOfRows {
            var isRowTheSame = true
            for j in 1..<numOfColumns {
                if squares[i][j - 1].getPiece()?.id != squares[i][j].getPiece()?.id || squares[i][j].getPiece()?.id == nil {
                    isRowTheSame = false
                }
            }
            if isRowTheSame {
                return true
            }
        }
        return false
    }

    func hasSamePieceVertical() -> Bool {
        for i in 0..<numOfColumns {
            var isColumnTheSame = true
            for j in 1..<numOfRows {
                if squares[j][i].getPiece()?.id != squares[j - 1][i].getPiece()?.id || squares[j][i].getPiece()?.id == nil {
                    isColumnTheSame = false
                }
            }
            if isColumnTheSame {
                return true
            }
        }
        return false
    }

    func hasSamePieceCrossly() -> Bool {
        var isCrossTheSame = true
        //Check main cross 0,0 - 1,1 - 2,2
        for i in 1..<numOfRows {
            if squares[i][i].getPiece()?.id != squares[i - 1][i - 1].getPiece()?.id || squares[i][i].getPiece()?.id == nil {
                isCrossTheSame = false
            }
        }
        if isCrossTheSame != true {
            isCrossTheSame = true //reset flag
            //Check the another cross 0,2  -   1,1    -   2,0
            var currentColumnIndex = numOfColumns - 2
            for i in 1..<numOfRows {
                if squares[i][currentColumnIndex].getPiece()?.id != squares[i - 1][currentColumnIndex + 1].getPiece()?.id || squares[i][currentColumnIndex].getPiece()?.id == nil {
                    isCrossTheSame = false
                }
                currentColumnIndex = currentColumnIndex - 1
            }
            return isCrossTheSame

        }
        return isCrossTheSame
    }
    
    func printBoard() {
        var text = ""
        for i in 0..<numOfRows {
            for j in 0..<numOfColumns {
                let data = squares[i][j].getPiece()?.getData() ?? "-"
                text  = text + String(describing: data) +  (j == (numOfColumns - 1) ? "" : ",")
            }
            text = text + "\n"
        }
        print(text)
    }
}

