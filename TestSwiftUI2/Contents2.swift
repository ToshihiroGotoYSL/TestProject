//
//  Contents2.swift
//  TestSwiftUI2
//
//  Created by Toshihiro Goto on 2019/11/11.
//  Copyright © 2019 Toshihiro Goto. All rights reserved.
//

import SwiftUI

struct Contents2: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReaderView()
        }
    }
}

struct GeometryReaderView : View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach((0...10), id: \.self) { _ in
                    GeometryReader { geometry in
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.init(red: 1.0-Double(1.8-self.getScale(geometry)), green: 0, blue: 0))
                            .scaleEffect(self.getScale(geometry))
                        }
                    .frame(width: 100, height: self.magnification * 100)
                    .padding()
                }
            }
        }
    }
    
    let halfScreenWidth = UIScreen.main.bounds.width / 2
    let magnification:CGFloat = 1.8
    
    func getScale(_ geometry: GeometryProxy) -> CGFloat {
        return max(1,-abs(magnification / halfScreenWidth * (geometry.frame(in: .global).midX - halfScreenWidth)) + magnification)
    }
}

struct Contents2_Previews: PreviewProvider {
    static var previews: some View {
        Contents2()
    }
}
