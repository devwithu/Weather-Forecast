//
//  ContentView.swift
//  Wheather-Forecast
//
//  Created by jdj on 2020/02/02.
//  Copyright © 2020 jdj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showView: Bool = false
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    init() {
        self.forecastViewModel = ForecastViewModel()
    }
    var body: some View {
        ZStack {
            BackSplash()
            
            VStack{
                TopView(showField: self.showView, forecastViewModel: self.forecastViewModel)
                
                MidView(forecastViewModel: self.forecastViewModel)
            }
            
            VStack(alignment: .center, spacing: 8) {
                
                HStack {
                    //Image(systemName: Helper().showWeatherIcon(item: self.forecastViewModel.weatherForecast!))
                    Image(systemName: "cloud.hail")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.white)
                }

                
                CurrentTempView(forecastViewModel: self.forecastViewModel)
                
                Text("7-Day Weather Forecast")
                    .foregroundColor(.white)
                .bold()
                    .padding(.all, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(forecastViewModel.getForecastList(), id: \.dt) { forecast in
                            //Text(String((forecast.temp?.day!)!))
                            BottomScrollForecast(forecastData: forecast)
                        }
                    }
                }
            }

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// 4dff4a24e7fc57a0065fdb9f49e8542a
//
// https://api.openweathermap.org/data/2.5/forecast/daily?q=lisbon&appid=4dff4a24e7fc57a0065fdb9f49e8542a

//https://api.openweathermap.org/data/2.5/forecast?q=lisbon&appid=4dff4a24e7fc57a0065fdb9f49e8542a
