//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var phrase: String = ""
    @State var selectedSize = 30.0
  
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Heart Like Button")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
When pressed it bounces and grows while while changes colour. The slider bellow selects the size of the heart and circle. NOTE: the cirlce size will always be +45 compared to the heart
""")
             
                Slider(value: $selectedSize, in: 25...300)
                
            }
            .padding(.bottom)
            
            List {
                NavigationLink(destination: CustomComposableView(desiredSize: selectedSize)) {
                    SimpleListItemView(title: "Heart Like Button View",
                                       caption: "A like button that animates and changes colour")
                }
            }
            
        }
        .padding()
        .navigationTitle("Heart Like Button view")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
