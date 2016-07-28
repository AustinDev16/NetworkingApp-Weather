//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 4/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
extension CurrentWeather {
    var temperatureString: String {
        return "\(Int(self.temperature)) º"
    }
    
    var humidityString: String {
        return "\(Int(self.humidity * 100.0))%"
    }
    
    var precipProbabilityString: String {
        return "\(Int(self.precipProbability * 100.0 ))%"
    }
    
}
class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let icon = WeatherIcon.PartlyCloudyDay.image
        let currentWeather = CurrentWeather(temperature: 95.3, humidity: 0.54, precipProbability: 0.1, summary: "Sunny and humid!", icon: icon)
        display(currentWeather)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func display(currentWeather: CurrentWeather) {
        currentTemperatureLabel.text = currentWeather.temperatureString
        currentHumidityLabel.text = currentWeather.humidityString
        currentPrecipitationLabel.text = currentWeather.precipProbabilityString
        currentSummaryLabel.text = currentWeather.summary
        currentWeatherIcon.image = currentWeather.icon
    }

}

