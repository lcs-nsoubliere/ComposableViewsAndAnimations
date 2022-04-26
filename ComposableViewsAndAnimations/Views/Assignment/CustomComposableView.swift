//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    //MARK: Stored Properties
    //horizontal position
    @State var xOffset = -100.0
    
    //Rotation Amount
    @State var rotationAmount = 0.0
    
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
  
    //MARK: Computed Properties
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50, height: 50)
               
            
            Text("OK")
                .foregroundColor(.white)
        }
        .offset(x: xOffset, y: 0)
        .rotationEffect(.degrees(Double(rotationAmount)),anchor: .center)
        
        .animation(
            Animation
                .easeInOut(duration: 2)
                    .repeatForever(autoreverses: true)
        )
        
        .onReceive(timer) { input in
            //move the circle and text to the right
            xOffset = 100.0
            //turn once
            rotationAmount = 360.0
            
            //Turn off the timer
            timer.upstream.connect().cancel()
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
