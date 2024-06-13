//
//  ContentView.swift
//  Temperature Converter
//
//  Created by Pedro Romero on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputedValue = 0.0
    @State private var inputedTemp = "Celsius"
    
    let tempUnits = ["Celsius" , "Farhenheit", "Kelvin"]
    
    
    func convertToCelsius (value: Double, unit: String) -> Double{
        if unit == "Farhenheit"{
            return (value - 32) * 5 / 9
        }
        else if unit == "Kelvin"{
            return value - 273.15
        }
                else {
                    return value
                }
            }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Input Value..." , selection: $inputedTemp){
                        ForEach(tempUnits , id: \.self){
                            Text($0)
                        }
                    }
                    TextField("Temp" , value: $inputedValue , format: .number)
                        .keyboardType(.decimalPad)
                }
                Section ("Conversion"){
                    Text("Farenheit:               \(String(format: "%.2f" , convertToCelsius(value: inputedValue, unit: inputedTemp) * 9 / 5 + 32 ))")
                    Text("Celsius:                  \(String(format: "%.2f" , convertToCelsius(value: inputedValue, unit: inputedTemp)))")
                    Text("Kelvin:                    \(String(format: "%.2f" , convertToCelsius(value: inputedValue, unit: inputedTemp) + 273.15 )) " )
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

#Preview {
    ContentView()
}
