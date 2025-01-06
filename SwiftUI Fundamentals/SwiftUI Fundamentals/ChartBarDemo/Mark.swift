//
//  Mark.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 03/01/25.
//

import SwiftUI
import Charts
struct Mark: View {
    let weekdays = Calendar.current.shortWeekdaySymbols
    let steps = [ 10531, 6019, 7200, 8311, 7403, 6503, 9230 ]
    var body: some View {
        Chart {
            /*
            BarMark(
              x: .value("Day", "Monday"),
               y: .value("Steps", "6019")
               )
            
            BarMark(
              x: .value("Day", "Tuesday"),
               y: .value("Steps", "7200")
               )
            
            BarMark(
              x: .value("Day", "Wednesday"),
               y: .value("Steps", "200")
               )
            BarMark(
              x: .value("Day", "Thursday"),
               y: .value("Steps", "2100")
               )
             */
            ForEach(weekdays.indices, id: \.self) { index in
                BarMark(x: .value("Day", weekdays[index]),
                        y: .value("Steps", steps[index]))
                .foregroundStyle(by: .value("Day", weekdays[index]))
                .annotation {
                Text("\(steps[index])")
                }
            }
        }
    }
}

#Preview {
    Mark()
}
