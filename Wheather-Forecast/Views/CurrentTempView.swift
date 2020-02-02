//
//  CurrentTempView.swift
//  Wheather-Forecast
//
//  Created by jdj on 2020/02/02.
//  Copyright © 2020 jdj. All rights reserved.
//

import SwiftUI

struct CurrentTempView: View {
    
    @ObservedObject var forecastViewModel: ForecastViewModel

    var body: some View {
        VStack {
            HStack {
                Text(self.forecastViewModel.temperature)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                .bold()
                
                Text(self.forecastViewModel.weatherDescription)
                .foregroundColor(Color("secondary"))
                
            }
            
            HStack(spacing: 6) {
                VStack {
                    Text(self.forecastViewModel.windSpeed)
                    .bold()
                    .foregroundColor(Color("secondary"))
                    
                    Text("Wind")
                    .foregroundColor(Color("secondary"))
                }
                VStack {
                    Text(self.forecastViewModel.humidity)
                    .bold()
                    .foregroundColor(Color("secondary"))
                    
                    Text("Humidity")
                    .foregroundColor(Color("secondary"))
                }
                
                VStack {
                    Text(self.forecastViewModel.maxTemp)
                    .bold()
                    .foregroundColor(Color("secondary"))
                    
                    Text("Max")
                    .foregroundColor(Color("secondary"))
                }
            }
            

        }
    }
}
//
//#if DEBUG
//struct CurrentTempView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentTempView()
//    }
//}
//#endif
