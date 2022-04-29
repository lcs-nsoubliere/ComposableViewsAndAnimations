//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI


struct CustomComposableView: View {
    //let user create the size of the button
    let desiredSize: Double
 
    @State var circleColorChanged = false
    @State var heartColorChanged = false
    @State var heartSizeChanged = false
    
    var body: some View {
        
        ZStack {
            //create the circle that will chnage colour for the heart
            Circle()
                .frame(width: desiredSize + 45, height: desiredSize + 45)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
                .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
            
            //create the heart
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: desiredSize))
                .animation(nil)
            // Cancel the animation from here
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
                .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
        }
        //modify thew image
        .onTapGesture {
            self.circleColorChanged.toggle()
            self.heartColorChanged.toggle()
            self.heartSizeChanged.toggle()
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(desiredSize: 25)
    }
}
