//
//  ContentView.swift
//  UNI SPORT Basel
//
//  Created by Alexander Oxley on 26.07.19.
//  Copyright © 2019 Alexander Oxley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection){
            // MARK: - Home Tab
            Text("Home View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
            }
            .tag(0)
            
            // MARK: - Discovery Tab
            CategoryHome()
                .tabItem {
                    VStack {
                        Image(systemName: "book.fill")
                        Text("Discover")
                    }
            }
            .tag(1)
            
            // MARK: - Profile Tab
            Text("Profile View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
            .tag(2)
        }
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 7 Plus"))
//        ForEach(["iPhone SE", "iPhone XS Max", "iPhone 8", "iPhone 7 Plus"], id: \.self) { deviceName in
//            ContentView()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//        }
    }
}
#endif
