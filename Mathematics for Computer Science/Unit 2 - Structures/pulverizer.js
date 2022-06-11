function pulverizer(firstNumber, secondNumber) {
  // Invariants:
  // gcd(firstNumber, secondNumber) = gcd(x, y)
  // x = firstNumber*c + secondNumber*d
  // y = firstNumber*e + secondNumber*f

  let x = firstNumber;
  let y = secondNumber;
  let c = 1;
  let d = 0;
  let e = 0;
  let f = 1;

  while (x % y != 0) {
    quotient = Math.floor(x / y);
    [x, y] = [y, x % y];
    [c, d, e, f] = [e, f, c - quotient * e, d - quotient * f];
  }

  return [e, f];
}

function binaryPulverizer(firstNumber, secondNumber){
  //invariants
  //gcd(x,y) = gcd(firstNumber, secondNumber) (after filtering the 2's)
  // u_x*firstNumber + v_x*secondNumber = x
  // u_y*firstNumber + v_y*secondNumber = y
  let x = firstNumber;
  let y = secondNumber;
  let u_x = 1;
  let v_x = 0;
  let u_y = 0;
  let v_y = 1;
  
  while (x != y){
    if(x%2==0 && y%2==0){
      x = x/2;
      y = y/2;
    } else if (x%2==0 && u_x%2==0 && v_x%2==0){
      x = x/2;
      u_x = u_x/2;
      v_x = v_x/2;
    } else if (y%2==0 && u_y%2==0 && v_y%2==0){
      y = y/2;
      u_y = u_y/2;
      v_y = v_y/2;
    } else if (x > y){
      x = x - y;
      u_x = u_x - u_y;
      v_x = v_x - v_y;
    } else if (x < y){
      [x, y] = [y - x, x];
      [u_x, u_y] = [u_y - u_x, u_x];
      [v_x, v_y] = [v_y - v_x, v_x];
    } 
  }

  return [u_y, v_y];
}

console.log(pulverizer(899, 493));
console.log(binaryPulverizer(899, 493));
console.log(pulverizer(444, 398));
console.log(binaryPulverizer(444, 398));
console.log(binaryPulverizer(222, 199));
console.log(pulverizer(222, 199));
console.log(binaryPulverizer(222, 888));
console.log(pulverizer(222, 888));
