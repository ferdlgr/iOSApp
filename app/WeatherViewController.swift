//
//  WeatherViewController.swift
//  app
//
//  Created by DELGADO on 12/3/18.
//  Copyright © 2018 DELGADO. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
     let forecastAPIKey="cf7bed9c1b17c1574e210c9b73a597cb"
    let coordinate:(lat:Double,long:Double)=(37.8267,-122.4233)
    override func viewDidLoad() {
        super.viewDidLoad()
        let forecastService=ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long)
        {(currentWeather)in
            if let currentWeather=currentWeather{
                DispatchQueue.main.async {
                    if let temperature=currentWeather.temperature
                    {
                        self.temperatureLabel.text="\(temperature)"
                    }
                    else
                    {
                        self.temperatureLabel.text="_"
                    }
                    if let timezone=currentWeather.timezone
                    {
                        self.cityTextLabel.text="\(timezone)"
                    }else
                    {
                       // self.cityTextLabel.text="_"
                    }
                    }
                }
            }
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


