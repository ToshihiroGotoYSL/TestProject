//
//  ContentView.swift
//  TestSwiftUI2
//
//  Created by Toshihiro Goto on 2019/11/01.
//  Copyright © 2019 Toshihiro Goto. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var cardOffsetY:CGFloat = 40.0
    var body: some View {
        ZStack {
            Card().shadow(color: .primary, radius: 4, x: 0, y: 4)
            Card().shadow(color: .primary, radius: 4, x: 0, y: 4).offset(x: 0, y: cardOffsetY)
            Card()
                .shadow(color: .primary, radius: 4, x: 0, y: 4)
                .offset( x: viewState.width, y: viewState.height + cardOffsetY * 2)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                            self.show = true
                    }
                    .onEnded { value in
                        self.viewState = .zero
                        self.show = false
                    }
                )
        }
        .frame(minWidth: 0, maxWidth: 712, minHeight: 0, maxHeight: screen.height)
    }
}

struct Card: View {
    var title:String = "Card"
    
    var body: some View {
        HStack {
            Text(title)
        }
        .frame(width: 320, height: 200)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
