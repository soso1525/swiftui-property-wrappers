//
//  ContentView.swift
//  StateVsBinidng
//
//  Created by 소현 on 12/6/23.
//

import SwiftUI

/*
 
 f(s) = v
 f(s’) = v’
 
 When we modify a @State property,
 the view reconfigures with the updated state.
 We don’t modify our views directly.
 
 => Declarative programming
 
 @Binding creates a link to a @State property.
 We cannot create @Binding without @State.
 Modifying @Binding modifies @State.
 
 View A의 상태값을 View B에서 변경하여
 View A에서 변경된 상태값을 사용할 떄 @Binding 프로퍼티를 사용한다.
 
 */

struct ContentView: View {
    @State private var darkModeEnabled = false
    @State private var showDetailView = false
    
    var body: some View {
        ZStack {
            Color(darkModeEnabled ? .black : .white)
            
            Button {
                showDetailView.toggle()
            } label: {
                Label("Dark Mode Setting", systemImage: "gearshape")
                    .foregroundStyle(darkModeEnabled ? .yellow : .blue)
            }
            
        }
        .fullScreenCover(isPresented: $showDetailView, content: {
            SettingView(showDetailView: $showDetailView, 
                        darkModeEnabled: $darkModeEnabled)
        })
        .ignoresSafeArea()
    }
}

struct SettingView: View {
    
    // Cannot convert value of type 'Bool' to specified type 'Binding<Bool>'
    // @Binding 프로퍼티는 다른 뷰의 @State 프로퍼티로부터 생성되기 때문에
    // 반드시 혼자서 생성될 수 없으며 값을 지정할 수 없다.

    @Binding var showDetailView: Bool
    @Binding var darkModeEnabled: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Toggle(isOn: $darkModeEnabled) {
                    Text("Dark Model")
                }
                
                Button {
                    showDetailView.toggle()
                } label: {
                    Text("Dismiss")
                }
            }
            .padding()
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
