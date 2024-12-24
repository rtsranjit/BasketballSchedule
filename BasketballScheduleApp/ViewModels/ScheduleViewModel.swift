//
//  ScheduleViewModel.swift
//  BasketballScheduleApp
//
//  Created by Ranjit on 21/12/24.
//

import Foundation

import Foundation

class ScheduleViewModel: ObservableObject {
    
    let appTeamID: String = "1610612748"
    
    @Published var games: [ScheduleElement] = []
    @Published var teams: [Team] = []
    @Published var searchText: String = ""

    // Computed property to filter games based on search text
    var filteredGames: [ScheduleElement] {
        if searchText.isEmpty {
            return games
        } else {
            return games.filter { game in
                let teamMatches = (game.v?.ta?.lowercased().contains(searchText.lowercased()) ?? false) ||
                (game.h?.ta?.lowercased().contains(searchText.lowercased()) ?? false)
                let arenaMatches = game.arenaName?.lowercased().contains(searchText.lowercased()) ?? false
                let cityMatches = game.arenaCity?.lowercased().contains(searchText.lowercased()) ?? false
                return teamMatches || arenaMatches || cityMatches
            }
        }
    }
    
    // Group games by month
    var groupedGames: [[ScheduleElement]] {
        let grouped = Dictionary(grouping: filteredGames) { game -> String in
            let month = game.gametime?.toMonthString() ?? "Unknown"
            return month
        }
        
        // Sort the dictionary keys (months) chronologically
        let sortedKeys = grouped.keys.sorted { key1, key2 in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM yyyy"
            if let date1 = dateFormatter.date(from: key1),
               let date2 = dateFormatter.date(from: key2) {
                return date1 < date2
            }
            return key1 < key2
        }
        
        // Sort games within each group by gametime (converted to Date)
        return sortedKeys.compactMap { key in
            grouped[key]?.sorted { game1, game2 in
                guard let date1 = game1.gametime?.toFormatDate(),
                      let date2 = game2.gametime?.toFormatDate() else {
                    return false
                }
                return date1 < date2
            }
        }
    }

    init() {
        loadData()
    }
    
    func loadData() {
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.fetchTeams()
            self.fetchSchedule()
        }
    }
    
    private func fetchTeams() {
        // Simulate fetching teams JSON
        guard let url = Bundle.main.url(forResource: "teams", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            let decodedTeams = try JSONDecoder().decode(Teams.self, from: data)
            if let teams = decodedTeams.data?.teams {
                self.teams = teams
            }
        } catch {
            print("Error fetching teams data: \(error)")
        }
    }
    
    private func fetchSchedule() {
        // Simulate fetching schedule JSON
        guard let url = Bundle.main.url(forResource: "Schedule", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            let decodedGames = try JSONDecoder().decode(Schedule.self, from: data)
            if let schedules = decodedGames.data?.schedules {
                self.games = schedules
            }
        } catch {
            print("Error fetching schedule data: \(error)")
        }
    }
    
    func getTeamDetail(tid: String) -> Team? {
        return teams.first { $0.tid == tid }
    }
}
