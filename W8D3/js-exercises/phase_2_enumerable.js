Array.prototype.myEach = function(callback){
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
};

// [2,5,6,7,3].myEach((ele) => {
//     console.log(`addition of ${ele} + ${ele} equals to ${ele + ele}`);
// });


Array.prototype.myMap = function(callback) {
    let arr = [];

    this.myEach( x => arr.push(callback(x)) );

    return arr;
};

// console.log([2,5,6,7,3].myMap( ele => ele * ele));

Array.prototype.myReduce = function(callback, initialValue) {
    
    let arr = this;

    if (initialValue == null) {
        initialValue = arr[0];
        arr = arr.slice(1);
    } 

    // console.log(initialValue);

    let sum = initialValue;

    arr.myEach(x => sum = callback(sum, x));

    return sum;
}

console.log([2,5,6,7,3].myReduce( (sum, ele) => sum + ele));

