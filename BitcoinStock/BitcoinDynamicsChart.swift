//
//  BitcoinDynamicsChart.swift
//  BitcoinStock
//
//  Created by Emin Bari on 13.08.2020.
//

import SwiftUI

struct Data{
    let value: Double
    let date: Date
}

struct BitcoinDynamicsChart: View {
    
    let tempGradient = Gradient(colors: [
      .purple,
      Color(red: 0, green: 0, blue: 139.0/255.0),
      .blue,
      Color(red: 30.0/255.0, green: 144.0/255.0, blue: 1.0),
      Color(red: 0, green: 191/255.0, blue: 1.0),
      Color(red: 135.0/255.0, green: 206.0/255.0, blue: 250.0/255.0),
      .green,
      .yellow,
      .orange,
      Color(red: 1.0, green: 140.0/255.0, blue: 0.0),
      .red,
      Color(red: 139.0/255.0, green: 0.0, blue: 0.0)
    ])
    
    var measurements: [Data] = [
        Data(value: 3, date: Date().addingTimeInterval(600)),
        Data(value: 1, date: Date().addingTimeInterval(1200)),
        Data(value: -2, date: Date().addingTimeInterval(2400)),
        Data(value: 5, date: Date().addingTimeInterval(4800)),
        Data(value: 7, date: Date().addingTimeInterval(9600)),
    ]
    
    func degreeHeight(_ height: CGFloat, range: Int) -> CGFloat {
      height / CGFloat(range)
    }
    
    func dayWidth(_ width: CGFloat, count: Int) -> CGFloat {
      width / CGFloat(count)
    }
    
    func dayOffset(_ date: Date, dWidth: CGFloat) -> CGFloat {
      CGFloat(Calendar.current.ordinality(of: .day, in: .year, for: date)!) * dWidth
    }
    
    func tempOffset(_ temperature: Double, degreeHeight: CGFloat) -> CGFloat {
      CGFloat(temperature + 10) * degreeHeight
    }
    
    func tempLabelOffset(_ line: Int, height: CGFloat) -> CGFloat {
      height - self.tempOffset(Double(line * 10),
                               degreeHeight: self.degreeHeight(height, range: 110))
    }
    
    func offsetFirstOfMonth(_ month: Int, width: CGFloat) -> CGFloat {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "M/d/yyyy"
      let foM = dateFormatter.date(from: "\(month)/8/2020")!
      let dayWidth = self.dayWidth(width, count: 365)
      return self.dayOffset(foM, dWidth: dayWidth)
    }
    
    func monthAbbreviationFromInt(_ month: Int) -> String {
      let ma = Calendar.current.shortMonthSymbols
      return ma[month - 1]
    }
    
    
    var body: some View {
        // 1
        GeometryReader { reader in
            ForEach(self.measurements, id: \.self.date) { measurement in
            // 2
            Path { p in
              // 3
              let dWidth = self.dayWidth(reader.size.width, count: 365)
              let dHeight = self.degreeHeight(reader.size.height, range: 110)
              // 4
              let dOffset = self.dayOffset(measurement.date, dWidth: dWidth)
                let lowOffset = self.tempOffset(measurement.value, degreeHeight: dHeight) - 0.5
              let highOffset = self.tempOffset(measurement.value, degreeHeight: dHeight)
              // 5
              p.move(to: CGPoint(x: dOffset, y: reader.size.height - lowOffset))
              p.addLine(to: CGPoint(x: dOffset, y: reader.size.height - highOffset))
              // 6
            }.stroke()
          }
            
            ForEach(-1..<3) { line in
              // 2
              Group {
                Path { path in
                  // 3
                  let y = self.tempLabelOffset(line, height: reader.size.height)
                  path.move(to: CGPoint(x: 0, y: y))
                  path.addLine(to: CGPoint(x: reader.size.width, y: y))
                  // 4
                }.stroke(line == 0 ? Color.black : Color.gray)
                // 5
                if line >= 0 {
                  Text("\(line * 10)°")
                    .offset(x: 10, y: self.tempLabelOffset(line, height: reader.size.height))
                }
              }
            }
            ForEach(1..<3) { month in
              Group {
                Path { path in
                  let dOffset = self.offsetFirstOfMonth(month, width: reader.size.width)
                  
                  path.move(to: CGPoint(x: dOffset, y: reader.size.height))
                  path.addLine(to: CGPoint(x: dOffset, y: 0))
                }.stroke(Color.gray)
                Text("\(self.monthAbbreviationFromInt(month))")
                  .font(.subheadline)
                  .offset(
                    x: self.offsetFirstOfMonth(month, width: reader.size.width) +
                      5 * self.dayWidth(reader.size.width, count: 365),
                    y: reader.size.height - 25.0)
              }
            }
        }

    }
}

struct BitcoinDynamicsChart_Previews: PreviewProvider {
    static var previews: some View {
        BitcoinDynamicsChart()
    }
}
