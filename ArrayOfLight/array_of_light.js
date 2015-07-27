// Write a function arrayOfLight(x) (get it? Lighthouse…? Come on!) which takes one parameter,
// a positive number, and returns an array containing all numbers from 0 up to and including the given number.

// Example: arrayOfLight(5) should return [0,1,2,3,4,5]\

// Tips:

// An empty array can be created by simply typing [].

// Adding values to an array can be done by assigning a value to an index directly via the = operator.



function arrayOfLight(range){
  var number = 0, array = [];
  while (number <= range) {
    array.push(number);
    console.log(number);
    number += 1;
  }
return array;
}

arrayOfLight(5);