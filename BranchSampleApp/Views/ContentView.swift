//
//  ContentView.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 21/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MovieListView().environmentObject(movies)
    }
}

#Preview {
    ContentView()
}
