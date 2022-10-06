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
                
                Picker(selection: $viewModel.cal, label: Text("Picker")) {
                    Text("カレンダー").tag(1)
                    Text("リマインダー").tag(2)
                }
                .pickerStyle(.segmented)
                
                TextField("タイトル", text: $viewModel.title)
                
                TextField("URL", text: .constant(""))
                
                Toggle(isOn: $viewModel.isOn) {
                    Text("終日")
                }
                
                DatePicker(selection: $viewModel.date, displayedComponents: [ viewModel.isOn ? [.date] : [.date, .hourAndMinute]]) {
                    Text(viewModel.cal == 1 ? "開始" : "日付")
                }
                
                if viewModel.cal == 1{
                    DatePicker(selection: $viewModel.date2, displayedComponents: [ viewModel.isOn ? [.date] : [.date, .hourAndMinute]]) {
                        Text("終了")
                    }
                }
                
                //                if #available(iOS 16.0, *) {
                //                    TextField("メモ", text: $viewModel.memo, axis: .vertical)
                //                } else {
                //                    // Fallback on earlier versions
                //                }
                
                ZStack(alignment: .topLeading) {
                    
                    if viewModel.memo.isEmpty {
                        Text("メモ")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding([.top, .trailing], 8.0)
                    }
                    
                    TextEditor(text: $viewModel.memo)
                        .padding(.leading, -4.0)
                }
            }
            .onChange(of: viewModel.date) { newValue in
                viewModel.hoge()
            }
            .toolbar {
                Text("追加")
            }
            .navigationTitle("aaa")
            .navigationBarTitleDisplayMode(.inline)
            //            .navigationBarHidden(i)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
