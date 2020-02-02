//
//  Service.swift
//  Wheather-Forecast
//
//  Created by jdj on 2020/02/02.
//  Copyright © 2020 jdj. All rights reserved.
//

import Foundation


class Services {
    
    let apiId = "ed60fcfbd110ee65c7150605ea8aceea"
    
    func getWeatherData(city: String, completion: @escaping (ForecastWeatherResponse?) -> ()) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&APPID=\(apiId)&units=imperial")
        else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(ForecastWeatherResponse.self, from: data)
        
            print("data \(weatherResponse!)")
            
            if let weatherResponse = weatherResponse {
                completion(weatherResponse)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
