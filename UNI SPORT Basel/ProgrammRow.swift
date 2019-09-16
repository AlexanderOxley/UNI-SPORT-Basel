//
//  ProgrammRow.swift
//  UNI SPORT Basel
//
//  Created by Alexander Oxley on 15.07.19.
//  Copyright © 2019 Alexander Oxley. All rights reserved.
//

import SwiftUI

struct ProgrammRow : View {
    var programm: Programm
    var body: some View {
        HStack {
            //            programm.image(forSize: 50)
            VStack {
                Text(programm.name)
//                Text(programm.leiter)
//                Text(programm.ort)
            }
            Spacer()
            if programm.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

#if DEBUG
struct ProgrammRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ProgrammRow(programm: programmData[0])
            ProgrammRow(programm: programmData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
