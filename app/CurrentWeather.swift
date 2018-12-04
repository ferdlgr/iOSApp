//
//  CurrentWeather.swift
//  app
//
//  Created by DELGADO on 12/3/18.
//  Copyright © 2018 DELGADO. All rights reserved.
//

import Foundation

class CurrentWeather
{
    let timezone:String?
    let temperature:Int?
    let humidity:Int?
    let precipProbability:Int?
    let summary:String?
    struct WeatherKey
    {
         static let timezone="timezone"
        static let temperature="temperature"
        static let humidity="humidity"
        static let precipProbability="precipProbability"
        static let summary="summary"
       
    }
    init(weatherDictionary:[String:Any])
    {
        timezone=weatherDictionary[WeatherKey.timezone]as?String
        
       if let temperatureDouble=weatherDictionary[WeatherKey.temperature]as?Double
       {
        temperature=Int(temperatureDouble)
        }else
       {
        temperature=nil;
        }
       if let  humidityDouble=weatherDictionary[WeatherKey.humidity]as?Double
       {
        humidity=Int(humidityDouble*100)
       }else{
        humidity=nil
        }
        if let precipProbabilityDouble=weatherDictionary[WeatherKey.precipProbability]as?Double{
            precipProbability=Int(precipProbabilityDouble*100)
        }
        else{
            precipProbability=nil
        }
        
        summary=weatherDictionary[WeatherKey.summary]as?String
    }
    
}


