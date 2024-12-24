//
//  ScheduleView.swift
//  BasketballScheduleApp
//
//  Created by Ranjit on 21/12/24.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    
    @State private var nextUpcomingGame: ScheduleElement?

    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                VStack {
                    List {
                        ForEach(viewModel.groupedGames.indices, id: \.self) { index in
                            Section(header: Text(viewModel.groupedGames[index].first?.gametime?.toMonthString() ?? "Unknown")) {
                                ForEach(viewModel.groupedGames[index], id: \.id) { game in
                                    GameRow(game: game)
                                        .id(game.id) // Assign a unique ID for scrolling
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .searchable(text: $viewModel.searchText, prompt: "Search by team, arena, or city")
                    .onAppear {
                        // Fetch data when the view appears
                        viewModel.loadData()
                    }
                    .onChange(of: viewModel.groupedGames) { _, _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            scrollToNextGame(proxy: proxy)
                        }
                    }
                }
            }
            .navigationTitle("Basketball Schedule")
        }
        .environmentObject(viewModel)
    }
    
    private func scrollToNextGame(proxy: ScrollViewProxy) {
        // Find the next game after the current date
        let currentDate = Date()
        for section in viewModel.groupedGames {
            for game in section {
                if let gameTime = game.gametime?.toFormatDate(), gameTime > currentDate, nextUpcomingGame == nil {
                    
                    nextUpcomingGame = game
                    
                    // Scroll to the next upcoming game
                    print(game.uid)
                    print(gameTime)
                    
                    withAnimation {
                        proxy.scrollTo(game.id, anchor: .top)
                    }
                    
                    return
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}

