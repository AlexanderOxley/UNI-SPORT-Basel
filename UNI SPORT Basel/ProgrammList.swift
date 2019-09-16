//
//  ProgrammList.swift
//  UNI SPORT Basel
//
//  Created by Alexander Oxley on 15.07.19.
//  Copyright © 2019 Alexander Oxley. All rights reserved.
//


import SwiftUI

struct ProgrammList : View {
   @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.programm) { programm in
                    if !self.userData.showFavoritesOnly || programm.isFavorite {
                        NavigationLink(destination: ProgrammDetail(programm: programm)
                            .environmentObject(self.userData)
                        ) {
                            ProgrammRow(programm: programm)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Programm"), displayMode: .large)
        }
    }
}

#if DEBUG
struct ProgrammList_Previews : PreviewProvider {
    static var previews: some View {
        ProgrammList()
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 7 Plus"))
    }
}
#endif
