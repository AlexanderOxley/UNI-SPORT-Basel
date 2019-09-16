//
//  CategoryRow.swift
//  UNI SPORT Basel
//
//  Created by Alexander Oxley on 26.07.19.
//  Copyright © 2019 Alexander Oxley. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Programm]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.title)
                .padding(.leading, 15)
                .padding(.top, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items, id: \.name) { programm in
                        NavigationLink(
                            destination: ProgrammDetail(
                                programm: programm
                            )
                        ) {
                            CategoryItem(programm: programm)
                        }
                    }
                }
            }
//            .frame(height: 50)
                .padding(.bottom, 20)
                .padding(.top, 0)
        }
    }
}

struct CategoryItem: View {
    var programm: Programm
    var body: some View {
        VStack(alignment: .leading) {
//            programm
//               .image(forSize: 155)
//                .renderingMode(.original)
//                .cornerRadius(5)
            Text(programm.name)
                .foregroundColor(.red)
                .font(.headline)
                .bold()
            Text(programm.leiter)
                .foregroundColor(.primary)
            Text(programm.ort)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#if DEBUG
struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: programmData[0].category.rawValue,
            items: Array(programmData.prefix(4))
        )
    }
}
#endif
