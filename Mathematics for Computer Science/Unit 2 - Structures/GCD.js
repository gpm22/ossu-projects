function gcd (first_number, second_number){

    if(first_number == second_number){
        return first_number;
    }

    if (second_number > first_number){
        return gcd(second_number, first_number);
    }

    if(second_number == 0){
        return first_number;
    }

    if(second_number == 1){
        return 1;
    }

    return gcd(second_number, first_number%second_number);
}



// Tests

console.log("gcd(10,2) == 2? " + (gcd(10, 2) == 2 ? "Yes" : "No") );
console.log("gcd(2,10) == 2? " + (gcd(2, 10) == 2 ? "Yes" : "No") );
console.log("gcd(331,0) == 331? " + (gcd(331, 0) == 331 ? "Yes" : "No") );
console.log("gcd(0,331) == 331? " + (gcd(0, 331) == 331 ? "Yes" : "No") );
console.log("gcd(331,1) == 1? " + (gcd(331, 1) == 1 ? "Yes" : "No") );
console.log("gcd(1,331) == 1? " + (gcd(1, 331) == 1 ? "Yes" : "No") );
console.log("gcd(7,7) == 7? " + (gcd(7, 7) == 7 ? "Yes" : "No") );
console.log("gcd(7,5) == 1? " + (gcd(7, 5) == 1 ? "Yes" : "No") );
console.log("gcd(5,7) == 1? " + (gcd(5, 7) == 1 ? "Yes" : "No") );
console.log("gcd(8,6) == 2? " + (gcd(8, 6) == 2 ? "Yes" : "No") );
console.log("gcd(12,8) == 4? " + (gcd(12, 8) == 4 ? "Yes" : "No") );