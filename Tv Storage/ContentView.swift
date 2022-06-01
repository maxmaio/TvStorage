//
//  ContentView.swift
//  Tv Storage
//
//  Created by Max Maio on 5/31/22.
//

import SwiftUI
func getAvailable() -> String {
    let fileURL = URL(fileURLWithPath:"/")
    do {
        let values = try fileURL.resourceValues(forKeys: [.volumeAvailableCapacityKey])
        if let capacity = values.volumeAvailableCapacity {
            let value = Double(capacity)/1000000000
            let display = round(100 * value) / 100
            return ("Space Available \(display) gb")
        } else {
            return ("Capacity is unavailable")
        }
    } catch {
        return ("Error retrieving capacity: \(error.localizedDescription)")
    }
}

func getTotal() -> String {
    let fileURL = URL(fileURLWithPath:"/")
    do {
        let values = try fileURL.resourceValues(forKeys: [.volumeTotalCapacityKey])
        if let capacity = values.volumeTotalCapacity {
            let value = Double(capacity)/1000000000
            let display = round(100 * value) / 100
            return ("Total space \(display) gb")
        } else {
            return ("Capacity is unavailable")
        }
    } catch {
        return ("Error retrieving capacity: \(error.localizedDescription)")
    }
}

struct ContentView: View {

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.brown]), startPoint: .topLeading, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                Group {
                    VStack {
                        Text(getAvailable())
                        Text(getTotal())
                    }
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
