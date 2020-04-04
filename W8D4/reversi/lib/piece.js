/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
    this.color = color;
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {x
    return (this.color === 'white' ? 'black' : 'white');
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
    return (this.color = this.oppColor());
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
    return (this.color === "black" ? "B" : "W");
};

module.exports = Piece;

x = new Piece('white')
// console.log(x)
// console.log(x.color)
// console.log(x.oppColor())
// console.log(x.flip())
// console.log(x.toString()==="black")



