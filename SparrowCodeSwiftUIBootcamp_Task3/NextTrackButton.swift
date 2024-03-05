//
//  NextTrackButton.swift
//  SparrowCodeSwiftUIBootcamp_Task3
//
//  Created by Валерий Зазулин on 05.03.2024.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Color.accentColor)
    }
}

struct NextTrackButton: View {
    
    @State var isAnimate: Bool = false
    
    var body: some View {
        Button {
            withAnimation(.bouncy(duration: 0.4, extraBounce: 0.2)) {
                isAnimate.toggle()
            } completion: {
                withAnimation(.linear(duration: 0.01)) {
                    isAnimate.toggle()
                }
            }
        } label: {
            HStack(spacing: -4) {
                Image(systemName: "play.fill")
                    .scaleEffect(isAnimate ? 1 : 0, anchor: .trailing)
                    .opacity(isAnimate ? 1 : 0)

                Image(systemName: "play.fill")
                
                Image(systemName: "play.fill")
                    .scaleEffect(isAnimate ? 0 : 1, anchor: .leading)
                    .opacity(isAnimate ? 0 : 1)
            }
            .font(.title)
            .offset(x: isAnimate ? 10 : -10)
            
        }
        .buttonStyle(PressableButtonStyle())
        
    }
}

#Preview {
    NextTrackButton()
}
