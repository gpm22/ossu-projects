function euclidianGcd(firstNumber, secondNumber) {
  if (firstNumber == secondNumber) {
    return firstNumber;
  }

  if (secondNumber > firstNumber) {
    return euclidianGcd(secondNumber, firstNumber);
  }

  if (secondNumber == 0) {
    return firstNumber;
  }

  if (secondNumber == 1) {
    return 1;
  }

  return euclidianGcd(secondNumber, firstNumber % secondNumber);
}

function binaryGcd(firstNumber, secondNumber) {
  return binaryGcdProcessor(firstNumber, secondNumber, 1);
}

function binaryGcdProcessor(firstNumber, secondNumber, auxiliar) {
  if (min(firstNumber, secondNumber) <= 0) {
    return auxiliar * max(firstNumber, secondNumber);
  }

  if (firstNumber % 2 == 0 && secondNumber % 2 == 0) {
    return binaryGcdProcessor(firstNumber / 2, secondNumber / 2, 2 * auxiliar);
  }

  if (firstNumber % 2 == 0) {
    return binaryGcdProcessor(firstNumber / 2, secondNumber, auxiliar);
  }

  if (secondNumber % 2 == 0) {
    return binaryGcdProcessor(firstNumber, secondNumber / 2, auxiliar);
  }

  if (firstNumber > secondNumber) {
    return binaryGcdProcessor(
      firstNumber - secondNumber,
      secondNumber,
      auxiliar
    );
  }

  if (firstNumber < secondNumber) {
    return binaryGcdProcessor(
      secondNumber - firstNumber,
      firstNumber,
      auxiliar
    );
  }

  return binaryGcdProcessor(1, 0, auxiliar * firstNumber);
}

function min(firstNumber, secondNumber) {
  return firstNumber > secondNumber ? secondNumber : firstNumber;
}

function max(firstNumber, secondNumber) {
  return firstNumber > secondNumber ? firstNumber : secondNumber;
}

// Tests

console.log("Starting tests\n");
console.log("euclidianGcd tests\n");

let date1 = new Date();

console.log(
  "euclidianGcd(10,2) == 2? " + (euclidianGcd(10, 2) == 2 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(2,10) == 2? " + (euclidianGcd(2, 10) == 2 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(331,0) == 331? " + (euclidianGcd(331, 0) == 331 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(0,331) == 331? " + (euclidianGcd(0, 331) == 331 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(331,1) == 1? " + (euclidianGcd(331, 1) == 1 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(1,331) == 1? " + (euclidianGcd(1, 331) == 1 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(7,7) == 7? " + (euclidianGcd(7, 7) == 7 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(7,5) == 1? " + (euclidianGcd(7, 5) == 1 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(5,7) == 1? " + (euclidianGcd(5, 7) == 1 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(8,6) == 2? " + (euclidianGcd(8, 6) == 2 ? "Yes" : "No")
);
console.log(
  "euclidianGcd(12,8) == 4? " + (euclidianGcd(12, 8) == 4 ? "Yes" : "No")
);

console.log("\nbinaryGcd tests\n");


let date2 = new Date();

console.log("binaryGcd(10,2) == 2? " + (binaryGcd(10, 2) == 2 ? "Yes" : "No"));
console.log("binaryGcd(2,10) == 2? " + (binaryGcd(2, 10) == 2 ? "Yes" : "No"));
console.log(
  "binaryGcd(331,0) == 331? " + (binaryGcd(331, 0) == 331 ? "Yes" : "No")
);
console.log(
  "binaryGcd(0,331) == 331? " + (binaryGcd(0, 331) == 331 ? "Yes" : "No")
);
console.log(
  "binaryGcd(331,1) == 1? " + (binaryGcd(331, 1) == 1 ? "Yes" : "No")
);
console.log(
  "binaryGcd(1,331) == 1? " + (binaryGcd(1, 331) == 1 ? "Yes" : "No")
);

console.log("binaryGcd(7,7) == 7? " + (binaryGcd(7, 7) == 7 ? "Yes" : "No"));
console.log("binaryGcd(7,5) == 1? " + (binaryGcd(7, 5) == 1 ? "Yes" : "No"));
console.log("binaryGcd(5,7) == 1? " + (binaryGcd(5, 7) == 1 ? "Yes" : "No"));
console.log("binaryGcd(8,6) == 2? " + (binaryGcd(8, 6) == 2 ? "Yes" : "No"));
console.log("binaryGcd(12,8) == 4? " + (binaryGcd(12, 8) == 4 ? "Yes" : "No"));

let date3 = new Date();

console.log("\nComparison between execution times\n");
let euclidianTime = (date2.getTime() - date1.getTime())*1000;
let binaryTime = (date3.getTime() - date2.getTime())*1000;

console.log("Executing time of euclidianGcd:" +euclidianTime );
console.log("Executing time of binaryGcd:" + binaryTime);
console.log("binaryGcd is faster? " +(binaryTime < euclidianTime? "Yes" : "No"));