//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Austin on 7/28/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let humidity: Double
    let precipProbability: Double
    let summary: String
    let icon: UIImage
}

extension CurrentWeather: JSONDecodable {
    init?(JSON: [String : AnyObject]){
        guard let temperature = JSON["temperature"] as? Double,
        humidity = JSON["humidity"] as? Double,
        precipProbability = JSON["precipProbability"] as? Double,
        summary = JSON["summary"] as? String,
        iconString = JSON["icon"] as? String else {
                return nil
        }
        
        let icon = WeatherIcon(rawValue: iconString).image
        
        self.temperature = temperature
        self.humidity = humidity
        self.precipProbability = precipProbability
        self.summary = summary
        self.icon = icon
        
    }
}





struct DataRequest {
    
    static let keyForAPI: String = "25d840b02df0c8664580b5ea6b8881f4"
    static let location: Coordinate = Coordinate(latitude: 37.8267, longitude: -122.423)
}


