//
//  ShapesView.swift
//  Weather App
//
//  Created by Efe Ozalp on 9/8/23.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        VStack{
            Circle()
                
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 100, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .background(.blue)
            Rectangle()
                .trim(from: 0, to: 0.5)
                .background(.green)
            Ellipse()
                .stroke(.orange,lineWidth: 5)
                .background(.brown)
            Capsule()
                .frame(width:300, height: 100)
                .foregroundColor(.cyan)
            RoundedRectangle(cornerRadius:10)
                .frame(width:200, height:100)
                .foregroundColor(.red)
        }.ignoresSafeArea()
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
