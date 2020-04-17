import React from "react";
import Tile from "./tile"

class Board extends React.Component {

  constructor(props) {
    super(props)
  }

  render(){
    return (
        <div className="board">
            {this.props.board.grid.map((row, rowIdx) => {
              return (
                <div className="row" key={rowIdx}>
                  {row.map((tile, tileIdx) => {
                    return (
                      <Tile 
                        key={[rowIdx, tileIdx]}
                        tile={tile}
                        updateGame={this.props.updateGame} 
                        className="tile"   
                      />
                    )
                  })}
                </div>
            )
            })}
        </div>
    )
  }

}

// {
// props.ingredients[index].map((ingredient, ingredientIndex) => {
//     return (
//         <div className="ingredient" key={ingredient}>
//             {ingredient}
//         </div>
//     )
// })
// }

export default Board;