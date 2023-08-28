pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Customcircuit () {  

//signals inputs
signal input a;
signal input b;

//signal from circuit
signal x;
signal y;

//Final signal output
signal output q;

//component Used to create the circuit
component andGate =AND();
component orGate = OR();
component notGate = NOT();

//circuit logic
  //and gate
   andGate.a <==a;
   andGate.b <==b;
   x<==andGate.out;
  
  //not gate
  
   notGate.in<==b;
   y<==notGate.out;
 
 //or gate
 
   orGate.a<==x;
   orGate.b<==y;

   q<==orGate.out;

   

}


template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}
component main = Customcircuit();