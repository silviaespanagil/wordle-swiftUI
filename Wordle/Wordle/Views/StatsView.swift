//
//  StatsView.swift
//  Wordle
//
//  Created by Silvia España on 2/3/22.
//

import SwiftUI

struct StatsView: View {
    
    @EnvironmentObject var dataModel: WordleDataModel
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            HStack {
                
                Spacer()
                
                Button {
                    withAnimation {
                        dataModel.showStats.toggle()
                    }
                } label: {
                    Text("X")
                }
                .offset(x:20, y: 10)
            }
            Text("STATISTICS")
                .font(.headline)
                .fontWeight(.bold)
            
            HStack (alignment: .top) {
                
                StatItem(value: dataModel.currentStat.games, text: "Played")
                if dataModel.currentStat.games != 0 {
                    
                    StatItem(value: (100 * dataModel.currentStat.wins/dataModel.currentStat.games), text: "Win %")
                }
                
                StatItem(value: dataModel.currentStat.streak, text: "Current Streak")
                    .fixedSize(horizontal: false, vertical: true)
                
                StatItem(value: dataModel.currentStat.maxStreak, text: "Max Streak")
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Text("GUESS DISTRIBUTION")
                .font(.headline)
                .fontWeight(.bold)
            
            VStack(spacing: 5) {
                
                ForEach (0..<6) { index in
                    
                    HStack {
                        Text("\(index + 1)")
                        
                        if dataModel.currentStat.frequencies[index] == 0 {
                            
                            Rectangle()
                                .fill(Color.wrong)
                                .frame(width: 22, height: 20)
                                .overlay(Text("0")
                                            .foregroundColor(.white))
                        } else {
                            if let maxValue = dataModel.currentStat.frequencies.max() {
                                Rectangle()
                                    .fill((dataModel.tryIndex == index && dataModel.gameOver)
                                          ? Color.correct
                                          : Color.wrong)
                                    .frame(width: CGFloat(dataModel.currentStat.frequencies[index])
                                           / CGFloat(maxValue) * 210,
                                           height: 20)
                                    .overlay(
                                        Text("\(dataModel.currentStat.frequencies[index])")
                                            .foregroundColor(.white)
                                            .padding(.horizontal,5),
                                        alignment: .trailing)
                            }
                        }
                        Spacer()
                    }
                }
                if dataModel.gameOver {
                    
                    HStack {
                        
                        Spacer()
                        Button {
                            
                            dataModel.shareResult()
                        } label: {
                            
                            HStack {
                                
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
                            }
                            .foregroundColor(.white)
                            .font(.caption)
                            .padding(8)
                            .background(Color.correct)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 40)
        .frame(width: 320, height: 370)
        .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.systemBackground))
        .padding()
        .shadow(color: .black.opacity(0.3), radius: 10)
        .offset(y: -7)
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity)
        .background(Color.correct.opacity(0.5))
        .ignoresSafeArea()
        
    }
}
struct StatsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StatsView()
            .environmentObject(WordleDataModel())
    }
}

struct StatItem: View {
    
    var value: Int
    var text: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.largeTitle)
            Text(text)
                .font(.caption)
                .frame(width: 50)
                .multilineTextAlignment(.center)
        }
    }
}
