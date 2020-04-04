Array.prototype.uniq = function(){
    let arr = [];
    this.forEach(x => {
        if (!arr.includes(x)){
            arr.push(x);
        }
    });
    // console.log(arr);
    return arr;
};


// console.log([1, 2, 2, 3, 3, 3].uniq());

Array.prototype.twoSum = function(){
    let sum = [];
    for(let i = 0; i < this.length; i++){
        for(let j = (i + 1); j < this.length; j++){  
            if (this[i] + this[j] === 0){
                sum.push([i, j]);
                // console.log(i);
                // console.log(j);
            }
        }
    }
    return sum;
};



// console.log([1,2,3,-3,-4,-2].twoSum());

// Array.prototype.transpose = function(){
//     let rows = this.length;
//     let cols = this[0].length;

//     let arr = [];
//     for(let i = 0; i < cols; i++){
//         let row_build = [];
//         for(let j = 0; j < rows; j++){
//             row_build.push(0);
//         }
//         arr.push(row_build);
//     }
    
//     console.log(arr);

//     for(let i = 0; i < this.length; i++){
//         for(let j = 0; j< this[0].length; j++){

//         }
//     }    

//     // var arr = [[],[]]
// }

Array.prototype.transpose = function(){
    let arr = new Array(this[0].length).fill(0).map(x => new Array())
    
    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this[i].length; j++) {
            arr[j][i] = this[i][j];
        }
    }
    return arr;
};

// 3 by 3
console.log([[1,1,1],[2,2,2],[3,3,3]].transpose());
// 3(this.length) by 2(this[0].length)
// should be transposed to 2(this[0].length) by 3(this.length)
console.log([[1,1],[2,2],[3,3]].transpose());

// let arr = new Array(this.length).fill(0).map(x => new Array())