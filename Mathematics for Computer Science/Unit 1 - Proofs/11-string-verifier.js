const verifyString = (string) => {
    if(string.length%2 != 0){
        return false;
    }
    
    for(let i = 1; i < string.length; i+=2){
        
        if(isCharNotALowerCaseLetter(string[i])){
            return false;
        }
        
        if(string[i] != string[i-1]){
            return false;
        }
    }
    return true;
}

const isCharNotALowerCaseLetter = (char) => {
    return !(/^[a-z]*$/.test(char));
}


const test = (testValues) => {
    [string, result] = testValues;
    console.log(`is ${result} the value of verifyString(${string})? ` + (result == verifyString(string) ? "Yes" : "No") );
}

let testList = [ ["aaccaabbzz", true], ["abb", false], ["00bb", false], ["AAbb", false], ["a", false] ];

testList.forEach(test);