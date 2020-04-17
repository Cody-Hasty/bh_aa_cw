import React from "react";
import Board from "./board";
import * as Minesweeper from "./minesweeper"

class Game extends React.Component{
  
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(5, 5)
    }
    this.updateGame = this.updateGame.bind(this);
    this.render = this.render.bind(this);

  }

  updateGame(tile, flagging) {
    if (flagging) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }
    this.setState({board: this.state.board});
    if (this.state.board.won()) {
      console.log("You won!");
    }
    if (this.state.board.lost()) {
      console.log("You lost!");
    }
  }
  
  render() {
    return ( 
      <div className = "game">
        This is the Game component
        <Board board={this.state.board} updateGame={this.updateGame} />

      </div> 

    )
  }

}

export default Game;