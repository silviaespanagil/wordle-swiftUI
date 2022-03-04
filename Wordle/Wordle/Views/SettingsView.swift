//
//  SettingsView.swift
//  Wordle
//
//  Created by Silvia España on 4/3/22.
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
//    @Environment(\.dismiss) var dismiss * Only available on ios 15+ *
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("Change Theme")
                Picker("Display Mode", selection: $colorSchemeManager.colorScheme) {
                    Text("Dark")
                        .tag(ColorScheme.dark)
                    Text("Light")
                        .tag(ColorScheme.light)
                    Text("System")
                        .tag(ColorScheme.unspecified)
                }
                .pickerStyle(.segmented)
                Spacer()
            }.padding()
            .navigationTitle("Options")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("**X**")
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SettingsView()
            .environmentObject(ColorSchemeManager())
    }
}
