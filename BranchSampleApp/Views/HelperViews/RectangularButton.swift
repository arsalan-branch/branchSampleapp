//
//  RectangularButton.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 21/01/24.
//

import SwiftUI

struct RectangleButtonView: View {
    var buttonName: String
    var buttonColor: Color
    var accentColor: Color = .accentColor
    var textColor: Color
    var height: CGFloat
    var horizontalPadding: CGFloat = 0
    var imageName: String = ""
    var imgwidth: CGFloat = 25
    var imgheight: CGFloat = 25
    var isSystemName = false
    var isSpacer = false
    var borderColor: Color = .gray
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(buttonColor)
                .frame(height: height)
                .padding(.horizontal, horizontalPadding)
            HStack {
                if imageName != "" {
                    if isSystemName {
                        Image(systemName: imageName)
                            .resizable()
                            .frame(width: imgwidth, height: imgheight)
                            .accentColor(accentColor)
                            .padding(.leading, 10)
                    } else {
                        Image(imageName)
                            .resizable()
                            .frame(width: imgwidth, height: imgheight)
                            .padding(.leading, isSpacer ?  12.5 : 0)
                    }
                }
                Text(buttonName)
                    .font(.body)
                    .foregroundColor(textColor)
                    .padding(.leading, 5)
                if isSpacer {
                    Spacer()
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(borderColor, lineWidth: 0.0)
                .padding(.horizontal, horizontalPadding)
        )

    }
}
