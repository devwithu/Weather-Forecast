//
//  ForecastViewModel.swift
//  Wheather-Forecast
//
//  Created by jdj on 2020/02/02.
//  Copyright © 2020 jdj. All rights reserved.
//

import Combine
import SwiftUI

class ForecastViewModel: ObservableObject {
    var weatherServices: Services!
    var cityName: String = "Seoul"
    
    @Published var weatherForecast : ForecastWeatherResponse?
    
    init() {
        self.weatherServices = Services()
    }
    func getForecastList() -> [MainForecastParams] {
        if let mList  = self.weatherForecast?.list {
            return mList
        }
        return []
    }
    
    var currentCity: String {
        if let city = self.weatherForecast?.city?.name {
            return city
        } else {
            return ""
        }
    }
    
    var currentCountry: String {
        if let country = self.weatherForecast?.city?.country {
            return country
        } else {
            return ""
        }
    }
    
    var weatherDay: String {
        if let day = self.weatherForecast?.list?.first?.dt {
            let formattedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formattedDay
        } else {
            return ""
        }
    }
    
    var temperature: String {
        if let temp = self.weatherForecast?.list?.first?.temp?.day {
            let formattedString = String(format: "%.0f", temp)
            return formattedString + "º"
        } else {
            return ""
        }
    }
    
    var weatherDescription: String {
        if let description = self.weatherForecast?.list?.first?.weather?.description.description {
            print(description)
            return description
        } else {
            return ""
        }
    }
   
    var windSpeed: String {
        if let speed = self.weatherForecast?.list?.first?.speed {
            let formattedSpeed = String(format: "%1.f", (speed))
            return formattedSpeed + "mi/h"
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let hum = self.weatherForecast?.list?.first?.humidity {
            let formattedHum = String(hum)
            return formattedHum + "%"
        } else {
            return ""
        }
    }
    
    var maxTemp: String {
        if let max = self.weatherForecast?.list?.first?.temp?.max {
            let formattedMaxTemp = String(format: "%.0f", (max))
            return formattedMaxTemp + "º"
        } else {
            return ""
        }
    }
    
    func searchCity() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeatherForecast(by: city)
        }
    }
    
    func fetchWeatherForecast(by city: String) {
        self.weatherServices.getWeatherData(city: cityName) {
            forecast in
            if let forecast = forecast {
                DispatchQueue.main.async {
                    self.weatherForecast = forecast
                }
            }
        }
    }
}

