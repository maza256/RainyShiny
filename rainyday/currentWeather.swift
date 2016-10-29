//
//  currentWeather.swift
//  rainyday
//
//  Created by Marek Stefanowski on 29/10/2016.
//  Copyright © 2016 frequen. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }

    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return (_currentTemp - 273.5)
    }
    
    var date: String {
        if _date == nil{
            _date = ""
            
        }
        
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        let currentDate = dateFormat.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire Download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(currentWeatherURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject>
            {
                if let name = dict["name"] as? String
                {
                    self._cityName = name.capitalized
                }
                if let mainDescription = dict["main"] as? Dictionary<String, AnyObject>
                {
                    if let theTemp = mainDescription["temp"] as? Double
                    {
                        self._currentTemp = theTemp
                    }
                    
                }
                if let weatherDict = dict["weather"] as? [Dictionary<String, AnyObject>]
                {
                    if let weatherDescription = weatherDict[0]["main"] as? String
                    {
                            self._weatherType = weatherDescription
                    }
                }

            }
            
        }
        completed()
        
    }
    
    
    
}

