//
//  CalcView.swift
//  Weather App
//
//  Created by Lorenzo J. Ablis on 9/8/23.
//

import SwiftUI
import Foundation

struct CalcView: View {
    @ObservedObject private var Calculator = CalculatorViewModel()
    @State private var operation: String?
    private let buttons = [["AC", "+/-", "%", "/"],
                           ["7", "8", "9", "X"],
                           ["4", "5", "6", "-"],
                           ["1", "2", "3", "+"],
                           ["0", ".", "="]]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("\(Calculator.displayUpdate())")
                    .frame(width:300, height:50, alignment: .trailing)
                    .font(.system(size:75, weight: .light))
                    .padding()
                    .foregroundColor(.white)
                ForEach(buttons, id:\.self) { row in
                    HStack(spacing: 13) {
                        ForEach(row, id: \.self) { button in
                            switch button {
                            case "/", "X", "-", "+":
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                    operation = button
                                }) {
                                    Text(button)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(operation == button ? .orange : .white)
                                        .font(.system(size:30))
                                        .background(operation == button ? .white : .orange)
                                        .clipShape(Circle())
                                }.shadow(radius: 3)
                            case "=":
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                    operation = nil
                                }) {
                                    Text(button)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(.white)
                                        .font(.system(size:30))
                                        .background(.orange)
                                        .clipShape(Circle())
                                }.shadow(radius: 3)
                            case "AC", "+/-", "%":
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                }) {
                                    Text(button)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(.black)
                                        .font(.system(size:30))
                                        .background(Color(uiColor: .lightGray))
                                        .clipShape(Circle())
                                }.shadow(radius: 3)
                            case "0":
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                }) {
                                    Text(button)
                                        .padding(28)
                                        .frame(width: 163, height: 75, alignment: .leading)
                                        .foregroundColor(.white)
                                        .font(.system(size:30))
                                        .background(Color(uiColor: .darkGray))
                                        .clipShape(Capsule())
                                }.shadow(radius: 3)
                            default:
                                Button(action: {
                                    Calculator.inputUpdate(input: button)
                                }) {
                                    Text(button)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(.white)
                                        .font(.system(size:30))
                                        .background(Color(uiColor: .darkGray))
                                        .clipShape(Circle())
                                }.shadow(radius: 3)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct CalcView_Previews: PreviewProvider {
    static var previews: some View {
        CalcView()
    }
}
