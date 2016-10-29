//
//  Constants.swift
//  rainyday
//
//  Created by Marek Stefanowski on 29/10/2016.
//  Copyright © 2016 frequen. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "fe04be9ee941fe69a7cefc13692ec08b"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)135\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()
