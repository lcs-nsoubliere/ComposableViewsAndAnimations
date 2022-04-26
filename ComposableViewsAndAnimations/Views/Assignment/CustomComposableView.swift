//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI


struct CustomComposableView: View {
 
@State private var isLoading = false
 
var body: some View {
        ZStack {


 //create the circle
            Circle()
            //(this code if also for the moving line that rotates)
                .trim(from: 0, to: 0.5)
                .stroke(Color.red, lineWidth: 20)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
            }
            //create the circle
                       Circle()
                       //(this code if also for the moving line that rotates)
                           .trim(from: 0, to: 0.5)
                           .stroke(Color.blue, lineWidth: 30)
                           .frame(width: 150, height: 150)
                           .rotationEffect(Angle(degrees: isLoading ? 0 : 360))
                           .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                           .onAppear() {
                               self.isLoading = true
                       }
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
