//
//  UserData.swift
//  UNI SPORT Basel
//
//  Created by Alexander Oxley on 26.07.19.
//  Copyright © 2019 Alexander Oxley. All rights reserved.
//
import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var programm = programmData
}
