//
//  TopView.swift
//  Wheather-Forecast
//
//  Created by jdj on 2020/02/02.
//  Copyright © 2020 jdj. All rights reserved.
//

import SwiftUI

let UIWidth = UIScreen.main.bounds.width
let UIHight = UIScreen.main.bounds.height

struct TopView: View {
    
    @State var showField: Bool = false
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                TextField("Enter City name",text: self.$forecastViewModel.cityName) {
                    self.forecastViewModel.searchCity()
                }.padding(.all, 10)
                    .frame(width: UIWidth - 50, height: 50)
                    .background(Color("lightBlue"))
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .offset(x: self.showField ? 0 : (-UIWidth / 2 - 180))
                    .animation(.spring())
                
                Image(systemName: "magnifyingglass.circle.fill")
                .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .offset(x: self.showField ? (UIWidth - 90) : -30)
                    .animation(.spring())
                    .onTapGesture {
                        self.showField.toggle()
                }
            }.onAppear(perform: fetch)
            
            

        }
        
        
    }
    
    private func fetch() {
        self.forecastViewModel.searchCity()
    }
}

//struct TopView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopView()
//    }
//}
