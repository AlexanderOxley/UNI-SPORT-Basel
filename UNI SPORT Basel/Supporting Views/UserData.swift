//
//  UserData.swift
//  UNI SPORT Basel
//
//  Created by Alexander Oxley on 25.07.19.
//  Copyright © 2019 Alexander Oxley. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject {
    let willChange = PassthroughSubject<Void, Never>()
        
    var showFavoritesOnly = false {
        willSet {
            willChange.send()
        }
    }

    var programm = programmData {
        willSet {
            willChange.send()
        }
    }
}
