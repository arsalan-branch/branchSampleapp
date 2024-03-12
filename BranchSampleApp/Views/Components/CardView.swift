//
//  CardView.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 21/01/24.
//

import SwiftUI

struct CardView: View {
    var movieName: String = "Oppenheimer"
    var directorName: String = "Christopher Nolan"
    var genreName: String = "Thriller"
    var movieCover: String = "Oppenheimer"
    var ratings: String = "8.4"
    var buy_price: Float = 20.0
    var rent_price: Float = 5.0
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.white)
            HStack{
            VStack(alignment: .leading, spacing: 4) {
                Image(movieCover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.375, height: 200)
                    .cornerRadius(10)
                    .padding(.bottom, 5)
                Text(movieName)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .bold()
                Text(genreName)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(10)
            Spacer()
        }
    }
    .frame(width: UIScreen.main.bounds.width * 0.4 , height: 230)
    .shadow(radius: 5)
    .padding(15)
   }
}

#Preview {
    CardView()
}
