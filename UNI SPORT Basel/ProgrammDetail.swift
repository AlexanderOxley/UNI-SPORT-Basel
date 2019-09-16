//
//  DetailImage.swift
//  UNI SPORT Basel
//
//  Created by Alexander Oxley on 14.07.19.
//  Copyright © 2019 Alexander Oxley. All rights reserved.
//

import SwiftUI

struct ProgrammDetail : View {
    @EnvironmentObject var userData: UserData
    
    var programm: Programm
    
    var programmIndex: Int {
        userData.programm.firstIndex(where: { $0.id == programm.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: programm.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height:200)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: programm.name)
                        .font(.title)
                    Button(action: {
                        self.userData.programm[self.programmIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.programm[self.programmIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                Text(verbatim: programm.ort)
                    .font(.subheadline)
                    .lineLimit(nil)
                
                Text(verbatim: "Raum: " + programm.raum)
                    .font(.subheadline)
                Text(verbatim: "LeiterIn: " + programm.leiter)
                    .font(.subheadline)
//                Text(verbatim: programm.session.day + " : " + programm.session.starttime + " bis " + programm.session.endtime)
//                    .font(.subheadline)
            }
            .padding()
            Spacer()
        }
    }
}

#if DEBUG
struct ProgrammDetail_Previews : PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max", "iPhone 8", "iPhone 7 Plus"], id: \.self) { deviceName in
            ProgrammDetail(programm: programmData[0])
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
#endif
