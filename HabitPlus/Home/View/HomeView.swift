//
//  HomeView.swift
//  HabitPlus
//
//  Created by Felipe Azevedo Dos Santos on 30/08/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("home view")
    }
}

#Preview {
    let viewModel = HomeViewModel()
    HomeView(viewModel: viewModel)
}
