//
//  Home.swift
//  UNI SPORT Basel
//
//  Created by Alexander Oxley on 26.07.19.
//  Copyright © 2019 Alexander Oxley. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Programm]] {
        .init(
            grouping: programmData,
            by: { $0.category.rawValue }
        )
    }
    
    var featured: [Programm] {
        programmData.filter { $0.isFeatured }
    }
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedProgramms(programms: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                //                Divider()
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: ProgrammList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
                .navigationBarItems(trailing: profileButton)
            //            .sheet(isPresented: $showingProfile) {
            //                ProfileHost()
            //            }
        }
    }
}

struct FeaturedProgramms: View {
    var programms: [Programm]
    var body: some View {
        programms[0].image(forSize: 250).resizable()
    }
}

#if DEBUG
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
#endif
