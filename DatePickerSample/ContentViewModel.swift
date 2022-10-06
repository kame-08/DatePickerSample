//
//  ContentViewModel.swift
//  DatePickerSample
//
//  Created by Ryo on 2022/10/04.
//

import Foundation

class contentViewModel:ObservableObject {
    
    @Published var isOn = false
    @Published var date = Date()
    @Published var date2 = Date() + (60 * 60 * 1) //1時間
    
    //カレンダーorリマインダー
    @Published var cal = 1
    
    //タイトル
    @Published var title = ""
    
    //メモ
    @Published var memo = ""
    
    func hoge() {
//        if date > date2 {
            date2 = date + (60 * 60 * 1)
//        }
    }
}
