//
//  Programm.swift
//  UNI SPORT Basel
//
//  Created by Alexander Oxley on 14.07.19.
//  Copyright © 2019 Alexander Oxley. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Programm: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var session: [Session]
    //var time: String
    var ort: String
    var raum: String
    var leiter: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    
    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case akrobatik = "Akrobatik"
        case berg = "Bergsport und Adventure"
        case body = "Body und Mind"
        case fitness = "Fitness"
        case kampf = "Kampfsport und Kampfkunst"
        case spiel = "Spielsport"
        case betreuung = "Sportbetreuung"
        case tanz = "Tanz"
        case wasser = "Wassersport"
        case zusatz = "Zusatzangebote für Mitarbeitende"
    }
    
//    enum Day: String, CaseIterable, Codable, Hashable {
//        case monday = "Monday"
//        case tuesday = "Tuesday"
//        case wednesday = "Wednesday"
//        case thursday = "Thursday"
//        case friday = "Friday"
//        case saturday = "Saturday"
//        case sunday = "Sunday"
//    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

struct Session: Hashable, Codable {
    var day: String
    var starttime: String
    var endtime: String
}
