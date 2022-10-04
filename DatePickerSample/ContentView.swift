//
//  ContentView.swift
//  DatePickerSample
//
//  Created by Ryo on 2022/10/04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = contentViewModel()
    var body: some View {
        NavigationView {
            Form {
                
                Toggle(isOn: $viewModel.isOn) {
                    Text("終日")
                }
                
                
                DatePicker(selection: $viewModel.date, displayedComponents: [ viewModel.isOn ? [.date] : [.date, .hourAndMinute]]) {
                    Text("開始")
                }
                
                
                
                DatePicker(selection: $viewModel.date2, displayedComponents: [ viewModel.isOn ? [.date] : [.date, .hourAndMinute]]) {
                    Text("終了")
                }
                
            }
            .onChange(of: viewModel.date) { newValue in
                viewModel.hoge()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
