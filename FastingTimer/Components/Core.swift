//
//  Core.swift
//  FastingTimer
//
//  Created by Dyobi on 4/22/22.
//

import SwiftUI

struct Core: View {
    
    @EnvironmentObject var fastingManager: FastingManager
    
    var title: String {
        switch fastingManager.fastingState {
        case .notStarted:
            return "Let's get started!"
        case .fasting:
            return "You are now fasting"
        case .feeding:
            return "You are now feeding"
        }
    }
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 40) {
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.3259833455, green: 0.472497046, blue: 1, alpha: 1)))
                
                Text(fastingManager.fastingPlan.rawValue)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Spacer()
                
            } // VStack
            .padding()
            
            VStack(spacing: 40) {
                
                ProgressRing()
                    .environmentObject(fastingManager)
                
                HStack(spacing: 60) {
                    
                    VStack(spacing: 5) {
                        
                        Text(fastingManager.fastingState == .notStarted ? "Start" : "Started")
                            .opacity(0.7)
                        
                        Text(fastingManager.startTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                        
                    } // VStack
                    
                    VStack(spacing: 5) {
                        
                        Text(fastingManager.fastingState == .notStarted ? "End" : "Ends")
                            .opacity(0.7)
                        
                        Text(fastingManager.endTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                        
                    } // VStack
                    
                } // HStack
                
                Button {
                    fastingManager.toggleFastingState()
                } label: {
                    Text(fastingManager.fastingState == .fasting ? "End fast" : "Start fasting")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
                
            } // VStack
            .padding()
            
        } // ZStack
        .foregroundColor(.white)
        
    } // body
    
}

struct Core_Previews: PreviewProvider {
    static var previews: some View {
        Core()
            .environmentObject(FastingManager())
    }
}
