//
//  GaugeDemo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 07/01/25.
//

import SwiftUI

struct GaugeDemo: View {
    @State private var currentSpeed = 140.0
    var body: some View {
        //SpeedoMeter()
       // SpeedoMeterWithImage()
        Gauge(value: currentSpeed, in: 0...200) {
        Image(systemName: "gauge.medium")
        .font(.system(size: 50.0))
        } currentValueLabel: {
        Text("\(currentSpeed.formatted(.number))")
        }
        .gaugeStyle(SpeedometerGaugeStyle())
    }
}



#Preview {
    GaugeDemo()
}


struct SpeedoMeter : View {
    @State private var currentSpeed = 120.0

    var body: some View {
        Gauge(value: currentSpeed, in: 0...200) {
            Text("Speed")
        } currentValueLabel: {
            Text("\(currentSpeed.formatted(.number))km/h")
        } minimumValueLabel: {
            Text(0.formatted(.percent))
        } maximumValueLabel: {
            Text(200.formatted(.percent))
        }
        .padding()

    }

}

struct SpeedoMeterWithImage : View {
    @State private var currentSpeed = 120.0

    var body: some View {
        Gauge(value: currentSpeed, in: 0...200) {
            Image(systemName: "gauge.medium")
                .font(.system(size: 50))
        } currentValueLabel: {
            HStack {
                Image(systemName: "gauge.high")
                Text("\(currentSpeed.formatted(.number))km/h")
            }        } minimumValueLabel: {
            Text(0.formatted(.percent))
        } maximumValueLabel: {
            Text(200.formatted(.percent))
        }
       // .padding()
        //.gaugeStyle(.accessoryLinear)
        .gaugeStyle(.accessoryCircular)
        .tint(.purple)


    }

}
