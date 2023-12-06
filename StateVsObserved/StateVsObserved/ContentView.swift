//
//  ContentView.swift
//  StateVsObserved
//
//  Created by 소현 on 12/6/23.
//

import SwiftUI

/*
 
 MVVM(Model - View - ViewModel)
 MVVM is a UI architectural design pattern for decoupling UI and non-UI code.
 
 ViewModel is responsible for noitfying view to update UI.
 ViewModel conforms to the ObservableObject protocol
 and uses @Published properties which notify the view to reconfigure itself.
 
 View observes ViewModel(StateObject or ObservedObject).
 When changes happen on the view model,
 view reconfigures itself with updated data.
 
 */

class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
    
//    init() {
//        print("Counter ViewModel initializer!")
//    }
    
    func increaseCount() {
        count += 1
    }
}

struct StateObservedCompareView: View {
//    @ObservedObject var viewModel = CounterViewModel()
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("Count: \(viewModel.count)")
            Button {
                viewModel.increaseCount()
            } label: {
                Text("Get view model count")
            }
            
            SubView(viewModel: viewModel)
                .padding()
        }
    }
}

struct SubView: View {
//    @StateObject var viewModel: CounterViewModel
    @ObservedObject var viewModel: CounterViewModel
    
    var body: some View {
        VStack {
            Text("Sub View Count: \(viewModel.count)")
        }
    }
}

struct ContentView: View {
    @State private var randomNumber: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Random Number: \(randomNumber)")
                Button {
                    randomNumber = (1...100).randomElement()!
                } label: {
                    Text("Get random number")
                }
            }
        
            StateObservedCompareView()
        }
    }
}


/*
 
 뷰가 분리된 상태애서 @State 프로퍼티와 @StateObject 또는 @ObservedObject 중
 어떤 것을 쓰는지에 따라 결과가 달라진다.
 
 @ObservedObject로 선언하면 @State 프로퍼티인 randomNumber 값이 변경될 때마다
 counter 값이 0으로 변경되지만, @StateObject로 선언하면 counter 값이 유지된다.
 
 @State 프로퍼티 값이 변경될 때마다 뷰를 통째로 버렸다가 새로 그리게 되는데
 이 때 @ObservedObject도 함께 버려지면서 새로운 ViewModel 객체가 생성된다.
 그래서 생성자에 로그를 남기면 뷰가 변경될 때마다 로그가 출력되는 것을 확인할 수 있다.
 반면 @StateObject 프로퍼티는 지속성이 유지되어 값을 잃지 않고 유지할 수 있다.
 
 (같은 뷰 안에서 @State 프로퍼티와 @ObservedObject 프로퍼티를 같이 쓰면 값에 변함이 없음.)
 
 만약 상위 뷰에서 @StateObject 프로퍼티를 사용하면
 하위 뷰에서 @ObservedObject 프로퍼티로 받아도 상태 값을 유지한다.
 하위 뷰만 @StateObject인 경우에도 상위 뷰는 값이 초기화되지만,
 하위 뷰는 상태를 유지하게 된다.
 
 */

#Preview {
    ContentView()
}
