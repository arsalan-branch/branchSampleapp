//
//  MovieListView.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 21/01/24.
//

import SwiftUI
import BranchSDK

struct MovieListView: View {
    @EnvironmentObject var movies: MovieViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(Array(movies.movies.enumerated()), id: \.element) { _, item in
                        CardView(movieName: item.title, directorName: item.director, genreName: item.genre, movieCover: item.coverImage, ratings: item.ratings, buy_price: item.buyPrice, rent_price: item.rentPrice)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .onTapGesture {
                            coordinator.push(view: MovieDetailView(id: item.id).environmentObject(movies))
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
            }
            .navigationTitle("Movies")
            .onAppear{
                //Tracking Content Event
                let event = BranchEvent.standardEvent(.viewItems)
//                event.alias = "\(movies.movies[index].title)"
//                event.eventDescription = "Viewed Movie -  \(movies.movies[index].title)"
//                event.customData["genre"] = "\(movies.movies[index].genre)"
                event.logEvent()
            }
        }
    }
}

#Preview {
    MovieListView()
}
