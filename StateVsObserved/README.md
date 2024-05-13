# StateObject vs ObservedObject

@State 프로퍼티 값이 변경되었을 때 뷰를 재 생성하는데 </br>
@StateObject 프로퍼티는 상태를 유지하지만 @ObservedObject 프로퍼티는 같이 버려졌다가 재 생성되면서 객체도 재 생성된다. </br>
(생성자에 로그 남겨서 비교 가능.) </br>
</br>
상위 뷰에서 @StateObject 프로퍼티를 사용하면 </br>
하위 뷰가 @ObservedObject 프로퍼티로 받더라도 상태가 유지된다. </br>
