//
//  ShapesView.swift
//  Weather App
//
//  Created by Efe Ozalp on 9/8/23.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        HStack{
            VStack{
                Circle()
                    .size(width:100, height:100)
                    .background(.blue)
                Rectangle()
                    .trim(from: 0, to: 0.7)
                    .fill(.green)
                Ellipse()
                    .stroke(.orange,lineWidth: 5)
                    .background(.brown)
                Capsule()
                    .frame(width:300, height: 100)
                    .foregroundColor(.cyan)
                RoundedRectangle(cornerRadius:10)
                    .frame(width:200, height:100)
                    .foregroundColor(.red)
                Rectangle()
                    .size(width:100,height:100)
                    .fill(.blue)
                    .frame(width: 100, height:100, alignment: .center)
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 25)
                    )
                    .padding()
                RoundedRectangle(cornerRadius:10)
                    .frame(width:300, height:50)
                    .foregroundColor(.blue)
                
            }.ignoresSafeArea()
        }
        
        
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
