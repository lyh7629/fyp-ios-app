//
//  SettingView.swift
//  fyp
//
//  Created by Yat Hin Leung on 20/9/2022.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello World")
                } header: {
                    Text("Hi")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
