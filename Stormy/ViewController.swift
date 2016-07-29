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
    
    private let forecastAPIKey = DataRequest.keyForAPI
//    private let locationString = DataRequest.locationString

    lazy var forecastAPIClient = {
        return ForecastAPIClient(APIKey: DataRequest.keyForAPI)
    }()
    let coordinate = DataRequest.location
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        forecastAPIClient.fetchCurrentWeather(coordinate){ result in
            switch result {
            case .Success(let currentWeather):
                dispatch_async(dispatch_get_main_queue()) {
                    self.display(currentWeather)
                }
            case .Failure(let error as NSError):
                dispatch_async(dispatch_get_main_queue()) {
                    self.showAlert("Unable to retrieve weather data", message: error.localizedDescription)
                }
            default: break 
            }
        }
        
        
        
       
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

    func showAlert(title: String, message: String?, style: UIAlertControllerStyle = .Alert){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let dismissAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(dismissAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}

