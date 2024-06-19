//
//  MovieDetailView.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 21/01/24.
//

import SwiftUI
import BranchSDK

struct MovieDetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var movies: MovieViewModel
    @State var showingCopyAlert = false
    @State private var showingFavAlert = false
    @State private var showingBuyAlert = false
    @State private var showingRentAlert = false
    let lp: BranchLinkProperties = BranchLinkProperties()
    var buo: BranchUniversalObject {
        BranchUniversalObject(canonicalIdentifier: "movie-\(movies.movies[index].id)")
    }
    var index: Int {
        movies.movies.firstIndex(where: { $0.id == id }) ?? 0
    }
    var id: Int
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ZStack {
                            Image(movies.movies[index].coverImage)
                                .resizable()
                                .stretchy()
                                .frame(height: UIScreen.main.bounds.height * 0.5)
                            HStack {
                                Button(action: {
                                    dismiss()
                                }, label: {
                                    VStack {
                                        HStack {
                                            Image(systemName: "chevron.backward.circle.fill")
                                                .resizable()
                                                .frame(width: 35, height: 35)
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        .padding(.leading, 15)
                                        Spacer()
                                    }
                                    .padding(.top, 50)
                                })
                                Spacer()
                                Button(action: {
                                    buo.title = "\(movies.movies[index].title)"
                                    buo.contentDescription = "\(movies.movies[index].description)"
                                    buo.imageUrl = "\(movies.movies[index].coverImage)"
                                   
                                    lp.channel = "twitter"
                                    lp.feature = "linkcreation"
                                    lp.campaign = "sdklinks"
                                    
                                    lp.addControlParam("$og_title", withValue: "\(movies.movies[index].title)")
                                    lp.addControlParam("$og_description", withValue: "\(movies.movies[index].description)")
                                    lp.addControlParam("$og_image_url", withValue: "https://img.freepik.com/free-vector/cinema-realistic-poster-with-illuminated-bucket-popcorn-drink-3d-glasses-reel-tickets-blue-background-with-tapes-vector-illustration_1284-77070.jpg?w=1800&t=st=1710269465~exp=1710270065~hmac=7ada7564ca432b5bfaba2ca66417e86951b5d7233b820b103feb6668e62d0158")
                                    //lp.addControlParam("$desktop_url", withValue: "https://bookdle.vercel.app/")
                                    //lp.addControlParam("$ios_url", withValue: "https://bookdle.vercel.app/")
                                    //lp.addControlParam("$fallback_url", withValue: "https://bookdle.vercel.app/")
                                    lp.addControlParam("$match_duration", withValue: "300")
                                    lp.addControlParam("nav_to", withValue: "movieDetail")
                                    lp.addControlParam("nav_id", withValue: "\(movies.movies[index].id)")
                                   createDeepLink(buo: buo, lp: lp){
                                        showingCopyAlert = true
                                    }
                                    //Track content event
                                    let event = BranchEvent.standardEvent(.share)
                                    event.alias = "\(movies.movies[index].title)"
                                    event.eventDescription = "Created link for \(movies.movies[index].title) movie"
                                    event.logEvent()
                                }, label: {
                                    VStack {
                                        Image(systemName: "doc.on.doc")
                                            .resizable()
                                            .frame(width: 20, height: 25)
                                            .foregroundStyle(.black)
                                            .background {
                                                Circle()
                                                    .foregroundColor(.white)
                                                    .frame(width: 35, height: 35)
                                            }
                                        Spacer()
                                    }
                                    .padding(.trailing, 20)
                                    .padding(.top, 50)
                                })
                                .alert("Link Copied to Clipboard!", isPresented: $showingCopyAlert) {
                                    Button("OK", role: .cancel) { }
                                }

                                Button(action: {
                                    movies.movies[index].isFav.toggle()
                                    
                                    //Track Custom Event
                                    let event = BranchEvent.customEvent(withName:"Favourite")
                                        event.customData["movie_name"] = "\(movies.movies[index].isFav)"
                                        event.customData["release_date"] = "\(movies.movies[index].releaseDate)"
                                         event.alias = "\(movies.movies[index].isFav)"
                                        event.logEvent()
                                   }, label: {
                                    VStack {
                                        Image(systemName: movies.movies[index].isFav ? "heart.fill" : "heart")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .offset(y: 2)
                                            .foregroundStyle(movies.movies[index].isFav ? .red : .black)
                                            .background {
                                                Circle()
                                                    .foregroundColor(.white)
                                                    .frame(width: 35, height: 35)
                                            }
                                        Spacer()
                                    }
                                    .padding(.trailing, 20)
                                    .padding(.top, 50)
                                })
                            }
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text(movies.movies[index].title)
                                    .font(.title)
                                    .bold()
                                    .padding(.leading, 15)
                                    .padding(.top, 15)
                                Text("Genre: " + movies.movies[index].genre)
                                    .font(.body)
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 15)
                                    .padding(.top, 1)
                                Text("Release Date: " + movies.movies[index].releaseDate)
                                    .font(.body)
                                    .foregroundStyle(.gray).padding(.leading, 15)
                                    .padding(.top, 1)
                                Text("Director: " + movies.movies[index].director)
                                    .font(.body)
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 15)
                                    .padding(.top, 1)
                                Text("Rating: " + movies.movies[index].ratings)
                                    .font(.body)
                                    .foregroundStyle(.gray).padding(.leading, 15)
                                    .padding(.top, 1)
                            }
                            Spacer()
                        }

                        Text(movies.movies[index].description)
                            .font(.body)
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                            .padding(.bottom, 110)
                            .multilineTextAlignment(.leading)
                    }
                }

                VStack(spacing: 0) {
                    Spacer()
                    LinearGradient(colors: [.white, .white.opacity(0.2)], startPoint: .bottom, endPoint: .top)
                        .frame(height: 20)
                    Color.white.overlay {
                        HStack{
                            Button(action: {
                                movies.movies[index].isBuy = true
                                //Track Commerce Event
                                let event = BranchEvent.standardEvent(.purchase)

                                // Add relevant event data:
                                event.alias            = "\(movies.movies[index].title)"
                                event.transactionID    = "12344555"
                                event.currency         = .USD
                                event.revenue          = NSDecimalNumber(value: movies.movies[index].buyPrice)
                                event.eventDescription = "Bought the movie - \(movies.movies[index].title)"
                                event.logEvent() // Log the event.

                            }, label: {
                                movies.movies[index].isBuy ?
                                RectangleButtonView(buttonName: "Bought at $\(String(format: "%.2f", movies.movies[index].buyPrice))", buttonColor: .blue.opacity(0.2), textColor: .white, height: 45)
                                :
                                RectangleButtonView(buttonName: "Buy at $\(String(format: "%.2f", movies.movies[index].buyPrice))", buttonColor: .blue, textColor: .white, height: 45)
                            })
                            .offset(y: -15)
                            Spacer()
                            Button(action: {
                                movies.movies[index].isRent = true
                                
                                let event = BranchEvent.standardEvent(.purchase)
                            
                                // Add the BranchUniversalObject with the content (do not add an empty branchUniversalObject):
                                event.contentItems     = [ buo ]
                            

                                // Add relevant event data:
                                event.alias            = "\(movies.movies[index].title)"
                                event.transactionID    = "12344555"
                                event.currency         = .USD
                                event.revenue          = NSDecimalNumber(value: movies.movies[index].rentPrice)
                                event.eventDescription = "Rented the movie - \(movies.movies[index].title)"
                                event.logEvent() // Log the event.
                            }, label: {
                                movies.movies[index].isRent ?
                                RectangleButtonView(buttonName: "Rented at $\(String(format: "%.2f", movies.movies[index].buyPrice))", buttonColor: .green.opacity(0.2), textColor: .white, height: 45)
                                :
                                RectangleButtonView(buttonName: "Rent at $\(String(format: "%.2f", movies.movies[index].rentPrice))", buttonColor: .green, textColor: .white, height: 45)
                            })
                            .offset(y: -15)
                        }
                        .padding(.horizontal, 20)
                    }
                    .frame(height: 80)
                }
            }
            .ignoresSafeArea()

        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            //Tracking Content Event
            let event = BranchEvent.standardEvent(.viewItem)
            event.alias = "\(movies.movies[index].title)"
            event.eventDescription = "Viewed Movie -  \(movies.movies[index].title)"
            
            event.customData["genre"] = "\(movies.movies[index].genre)"
            event.logEvent()
        }
    }
}
