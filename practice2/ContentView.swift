//
//  ContentView.swift
//  practice2
//
//  Created by Admin on 10/15/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var selectedTab = 0
    @State var email = ""
    @FocusState var isEmailFocused: Bool
    @State var pw = ""
    @State var pwShow: Bool = false
    
    @State var alert: Bool = false
    @State var lang = "한국어"
    let langs = [ "한국어", "일본어", "영어" ]
    
    @State var volume = 50.0
    @State var quantity = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                List {
                    NavigationLink("항목 1", value: "항목 1 데이터")
                    NavigationLink("항목 2", value: "항목 2 데이터")
                }
                
                // String.self: Hashable. 해시 변환
                // data class .hash() => 123213123213
                // - data1 (name: 홍길동, age: 18) => 123213123213
                // - data2 (name: 홍길동, age: 18) => 123213123213
                
                .navigationDestination(for: String.self) { data in
                    DetailView(data: data)
                }
                .navigationTitle("홈 화면")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("메뉴") {
                            print("메뉴 클릭됨")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            print("플러스 클릭됨")
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .tabItem {
                Image(systemName: "house")
                Text("홈")
            }
            .tag(0)
            
            VStack {
                Button("알림 표시") {
                    alert = true
                }
                
                Slider(value: $volume, in: 0...100, step: 1)
                Text("볼륨 \(Int(volume))")
                Stepper("수량: \(quantity)", value: $quantity, in: 1...100)
                
                Picker("언어", selection: $lang) {
                    ForEach(langs, id: \.self) { lang in
                        Text(lang)
                    }
                }
                .pickerStyle(.menu)
                
                Toggle("알림 허용", isOn: $alert)
                    .frame(width: 200)
                    .tint(.pink)
                
                Text("즐겨찾기 화면")
                
                // 플레이스 홀더: 실제 텍스트가 미리 박혀 있다.
                // 힌트: 실제 텍스트는 아니지만, 희미하게 보여지는 것
                TextField("이메일", text: $email)
                    .focused($isEmailFocused)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .submitLabel(.done)
                    .autocorrectionDisabled()
                
                ZStack {
                    if (pwShow) {
                        TextField("비밀번호", text: $pw)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.password)
                        
                    } else {
                        SecureField("비밀번호", text: $pw)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.password)
                    }
                    
                    Image(systemName: "person")
                }
                
                
                Button("마이페이지 이동") {
                    selectedTab = 2
                }
                
                Button("키보드 닫기") {
                    isEmailFocused = false
                }
                Button("키보드 열기") {
                    isEmailFocused = true
                }
                .disabled(isEmailFocused)
                
                Button("알러트 닫기") {
                    dismiss()
                }
            }
                .tabItem {
                    Image(systemName: "heart")
                    Text("즐겨찾기")
                }
                .tag(1)
            
//                .alert("제목", isPresented: $alert) {
//                    Button("확인", role: .cancel) {}
//                    Button("삭제", role: .destructive) {}
//                } message: {
//                    Text("알림 내용")
//                }
            
                .confirmationDialog("정렬 기준", isPresented: $alert) {
                    Button("최신순") {}
                    Button("인기순") {}
                    Button("취소", role: .cancel) {}
                } message: {
                    Text("정렬 기준을 선택하세요.")
                }
            
            VStack {
                Form {
                    Section("기본") {
                        Text("일반")
                        Text("접근성")
                        TextField("이름", text: $email)
                    }
                    Section("기본") {
                        Text("일반")
                        Text("접근성")
                        TextField("이름", text: $email)
                    }
                }
            }
                .tabItem {
                    Image(systemName: "person")
                    Text("마이")
                }
                .tag(2)
        }
        
    }
}

#Preview {
    ContentView()
}


struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let data: String
    
    var body: some View {
        VStack {
            Text(data)
            Text("상세 페이지 내용들")
            Text("상세 페이지 내용들")
            Text("상세 페이지 내용들")
            Text("상세 페이지 내용들")
            
            Button("뒤로가기") {
                dismiss()
            }
        }
        .navigationTitle("상세 화면")
    }
}
