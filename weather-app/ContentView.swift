//
//  ContentView.swift
//  weather-app
//
//  Created by Mandip Chaudhary on 27/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            ThemeView(isNight: $isNight)
            VStack {
                MainTitleView(title: "Rajapur, RP")
                
                MainIconView(iconName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                             temperature: 32)
                
                Spacer()
                
                HStack(spacing: 40) {
                    DayGridView(dayName: "SUN",
                                iconName: "cloud.sun.fill",
                                temperature: 29)
                    DayGridView(dayName: "MON",
                                iconName: "cloud.rain.fill",
                                temperature: 29)
                    DayGridView(dayName: "TUE",
                                iconName: "cloud.bolt.fill",
                                temperature: 29)
                    DayGridView(dayName: "WED",
                                iconName: "cloud.sun.bolt.fill",
                                temperature: 29)
                    DayGridView(dayName: "THU",
                                iconName: "cloud.moon.fill",
                                temperature: 29)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    ButtonView(isNight: $isNight, title: "Change Day Time")
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

struct ThemeView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .gray : .blue,
                                                    isNight ? .black : .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
    
}

struct MainTitleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 26, weight: .heavy, design: .default))
            .foregroundColor(.white)
    }
    
}

struct MainIconView: View {
    
    var iconName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .medium))
        }.padding(.bottom, 40)
    }
    
}

struct DayGridView: View {
    
    var dayName: String
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayName)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium))
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium))
        }
    }
    
}

struct ButtonView: View {

    @Binding var isNight: Bool
    
    var title: String
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .foregroundColor(.white)
            .font(.system(size: 24, weight: .bold, design: .default))
            .background(isNight ? .gray : .blue)
            .cornerRadius(10)
    }
    
}
