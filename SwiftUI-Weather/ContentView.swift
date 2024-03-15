//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by George on 15.02.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatisView(imageName: isNight ? "moon.stars.fill"  : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", ImageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", ImageName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "THU", ImageName: "wind.snow", temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI", ImageName: "sunset.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT", ImageName: "snow", temperature: 25)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var ImageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack() {
            Text(dayOfWeek).font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatisView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack (spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
        
    }
}


