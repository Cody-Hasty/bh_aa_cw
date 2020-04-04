/* 
    Go through the Piece class of Reversi first, then the Board class
    Go through the methods in this order:
    1. `_makeGrid` and the Constructor function
    2. `isValidPos` & `getPiece`
    3. `isMine` & `isOccupied`
    4. `_positionsToFlip`
    5. `validMove`
    6. `placePiece` and `validMoves`
    7. `hasMove`
    8. `isOver` 
*/

const Game = require("../lib/game");

const game = new Game();
game.play();
