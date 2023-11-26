//
//  WeatherButton.swift
//  SwiftUi-Weather
//
//  Created by Jinho Shin on 2023/11/26.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, design: .default))
            .cornerRadius(10)
    }
}

