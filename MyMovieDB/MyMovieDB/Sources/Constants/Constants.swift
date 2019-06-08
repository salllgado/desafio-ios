//
//  Constants.swift
//  MyMovieDB
//
//  Created by Chrytian Salgado Pessoal on 26/05/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

var app_key: String = "e1694c199ec268346e637bc040fad518"
var scheme: String = "https"
var baseUrl: String = "api.themoviedb.org"

let imageBaseUrl = "https://image.tmdb.org/t/p/"

enum ImageQuality: String {
    case low = "w185"
    case medium = "w500"
    case high = "w720"
}
