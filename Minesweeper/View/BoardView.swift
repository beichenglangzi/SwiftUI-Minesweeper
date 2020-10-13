//
//  ContentView.swift
//  Minesweeper
//
//  Created by Brandon Baars on 10/11/20.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var game: Game

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<game.board.count, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<game.board[row].count, id: \.self) { col in
                        CellView(cell: game.board[row][col])
                    }
                }
            }
        }.alert(isPresented: $game.didLose) {
            Alert(title: Text("Oh no!"),
                  message: Text("You clicked on a bomb"),
                  primaryButton: .destructive(Text("Reset")) {
                    game.reset()
                  }, secondaryButton: .cancel())
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    private static var gameSettings = GameSettings()
    static var previews: some View {
        BoardView()
            .environmentObject(Game(from: gameSettings))
    }
}
