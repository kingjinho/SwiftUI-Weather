//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Jinho Shin on 2023/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino", stateName: "CA")
                
                TodayWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
                    .padding(.bottom, 48)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                   temperature: 76)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "sun.dust.fill", temperature: 55)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "sun.max.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.snow.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "Sat", imageName: "moon.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "Sun", imageName: "cloud.drizzle.fill", temperature: 88)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
            Text("\(temperature)°")
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
        
//        LinearGradient(gradient: Gradient(colors: [
//            isNight ? .black : .blue ,
//            isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var stateName: String
    var body: some View {
        Text("\(cityName), \(stateName)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct TodayWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

