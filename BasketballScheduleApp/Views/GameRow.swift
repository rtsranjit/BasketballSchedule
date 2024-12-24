//
//  GameRow.swift
//  BasketballScheduleApp
//
//  Created by Ranjit on 21/12/24.
//

import SwiftUI

struct GameRow: View {
    
    @EnvironmentObject var viewModel: ScheduleViewModel
    
    let game: ScheduleElement
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                // Display the game time (date) and status
                Text(viewModel.appTeamID == game.h?.tid ? "HOME" : "AWAY")
                    .font(.subheadline)
                Text(" |   " + (game.gametime?.toReadableDate() ?? ""))
                    .font(.subheadline)
                Text(" |   " + (game.stt ?? "").uppercased())
                    .font(.subheadline)
            }
            .padding(.bottom, 5)
            
            HStack {
                // Display the visitor team (left side)
                if let visitorTeam = game.v {
                    VStack(alignment: .center) {
                        if let tid = visitorTeam.tid,
                           let logo = viewModel.getTeamDetail(tid: tid)?.logo {
                            AsyncImage(url: URL(string: logo)) { $0.image?.resizable() ?? Image(systemName: "photo") }
                                .frame(width: 50, height: 50)
                        }
                        if game.st != GameStatus.future.rawValue {
                            Text("\(visitorTeam.ta ?? "Unknown")").bold()
                        }
                    }
                }
                
                VStack(spacing: 0) {
                    
                    if game.st == GameStatus.live.rawValue {
                        Text("LIVE")
                    }
                    
                    HStack {
                        Group {
                            if game.st != GameStatus.future.rawValue {
                                Text(game.v?.s ?? "")
                            } else {
                                Text("\(game.v?.ta ?? "Unknown")").bold()
                            }
                        }
                        
                        // Display "VS" or "@" based on the game type (Home or Away)
                        Text(viewModel.appTeamID == game.h?.tid ? "VS" : "@")
                            .font(.title3)
                            .padding()
                        
                        Group {
                            if game.st != GameStatus.future.rawValue {
                                Text(game.h?.s ?? "")
                            } else {
                                Text("\(game.h?.ta ?? "Unknown")").bold()
                            }
                        }
                    }
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                }
                
                // Display the home team (right side)
                if let homeTeam = game.h {
                    VStack(alignment: .center) {
                        if let tid = homeTeam.tid,
                           let logo = viewModel.getTeamDetail(tid: tid)?.logo {
                            AsyncImage(url: URL(string: logo)) { $0.image?.resizable() ?? Image(systemName: "photo") }
                                .frame(width: 50, height: 50)
                        }
                        if game.st != GameStatus.future.rawValue {
                            Text("\(homeTeam.ta ?? "Unknown")").bold()
                        }
                    }
                }
            }
            
        }
        .padding()
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [
            game.st == GameStatus.past.rawValue ? Color.gray.opacity(0.3) : Color(hex: viewModel.getTeamDetail(tid: game.v?.tid ?? "")?.color ?? "#FFFFFF").opacity(0.7),
            game.st == GameStatus.past.rawValue ? Color.gray.opacity(0.3) : Color(hex: viewModel.getTeamDetail(tid: game.h?.tid ?? "")?.color ?? "#FFFFFF").opacity(0.7)
        ]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
        .shadow(radius: 5, x: 0, y: 5)
    }
}

//#Preview {
//    GameRow(game: ScheduleElement())
//}
