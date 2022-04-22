//
//  ContentView.swift
//  FastingTimer
//
//  Created by Dyobi on 4/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var fastingManager = FastingManager()
    
    var body: some View {
        
        ZStack {
            
            Color(#colorLiteral(red: 0.1053550169, green: 0.07161021978, blue: 0.08974323422, alpha: 1))
                .ignoresSafeArea()
            
            Core()
                .environmentObject(fastingManager)
            
        } // ZStack
        
    } // body
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
