# State vs Binding

f(s) = v</br> 
f(s') = v'</br>
(s = state, v = view)</br>
</br>
When we modify a @State property, the view reconfigures with the updated state.</br>
We don’t modify our views directly.</br>
This is the <b>DECLARATIVE PROGRAMMING</b>

@Binding creates a link to a @State property.</br>
We cannot create @Binding without @State.</br>
Modifying @Binding modifies @State.</br>
