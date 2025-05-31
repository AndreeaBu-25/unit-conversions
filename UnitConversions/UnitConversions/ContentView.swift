//
//  ContentView.swift
//  UnitConversions
//
//  Created by Andreea Bucsa on 09.04.2025.
//

import SwiftUI

struct ContentView: View
{
    @State private var convertMassFrom = ""
    @State private var convertMassTo = ""
    @State private var massVal = 0.0
    
    @State private var convertLengthFrom = ""
    @State private var convertLengthTo = ""
    @State private var lengthVal = 0.0
    
    @FocusState private var amountIsFocused: Bool
    
    let massUnits = ["mg", "cg", "dg", "g", "dag", "hg", "kg", "q", "t"]
    let lengthUnits = ["mm", "cm", "dm", "m", "dam", "hm", "km"]
    
    var massResult: Double
    {
        var newVal = 0.0
        switch convertMassFrom
        {
        case "mg":
            newVal = massVal * 1
        case "cg":
            newVal = massVal * 10
        case "dg":
            newVal = massVal * 100
        case "g":
            newVal = massVal * 1000
        case "dag":
            newVal = massVal * 10000
        case "hg":
            newVal = massVal * 100000
        case "kg":
            newVal = massVal * 1000000
        case "q":
            newVal = massVal * 100000000
        case "t":
            newVal = massVal * 1000000000
        default:
            newVal = 0
        }
        
        var rez = 0.0
        
        switch convertMassTo
        {
        case "mg":
            rez = newVal
        case "cg":
            rez = newVal / 10
        case "dg":
            rez = newVal / 100
        case "g":
            rez = newVal / 1000
        case "dag":
            rez = newVal / 10000
        case "hg":
            rez = newVal / 100000
        case "kg":
            rez = newVal / 1000000
        case "q":
            rez = newVal / 100000000
        case "t":
            rez = newVal / 1000000000
        default:
            rez = 0
        }
        return rez
    }
    
    var lengthResult: Double
    {
        var newVal = 0.0
        switch convertLengthFrom
        {
        case "mm":
            newVal = lengthVal * 1
        case "cm":
            newVal = lengthVal * 10
        case "dm":
            newVal = lengthVal * 100
        case "m":
            newVal = lengthVal * 1000
        case "dam":
            newVal = lengthVal * 10000
        case "hm":
            newVal = lengthVal * 100000
        case "km":
            newVal = lengthVal * 1000000
        default:
            newVal = 0
        }
        
        var rez = 0.0
        
        switch convertLengthTo
        {
        case "mm":
            rez = newVal
        case "cm":
            rez = newVal / 10
        case "dm":
            rez = newVal / 100
        case "m":
            rez = newVal / 1000
        case "dam":
            rez = newVal / 10000
        case "hm":
            rez = newVal / 100000
        case "km":
            rez = newVal / 1000000
        default:
            rez = 0
        }
        return rez
    }
    
    var body: some View
    {
        NavigationStack
        {
            Form
            {
                Section("Mass unit conversion")
                {
                    TextField("Value", value: $massVal, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Text("Convert from:")
                    Picker("Convert unit from", selection: $convertMassFrom)
                    {
                        ForEach(massUnits, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("To:")
                    Picker("Convert unit to", selection: $convertMassTo)
                    {
                        ForEach(massUnits, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("\(massVal.formatted())\(convertMassFrom) = \(massResult.formatted())\(convertMassTo)")
                }
                
                Section("Length unit conversion")
                {
                    TextField("Value", value: $lengthVal, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Text("Convert from:")
                    Picker("Convert unit from", selection: $convertLengthFrom)
                    {
                        ForEach(lengthUnits, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("To:")
                    Picker("Convert unit to", selection: $convertLengthTo)
                    {
                        ForEach(lengthUnits, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("\(lengthVal.formatted())\(convertLengthFrom) = \(lengthResult.formatted())\(convertLengthTo)")
                }
                
            }
            .navigationTitle("Unit Conversions")
        }
    }
}



#Preview
{
    ContentView()
}
