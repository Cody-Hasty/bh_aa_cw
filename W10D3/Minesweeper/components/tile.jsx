import React from "react";

class Tile extends React.Component {
  constructor(props) {
    super(props)
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(event){
    let flagging = event.altKey;
    
    let flaggedCSS = flagging ? "flaggedCSS" : "exploredCSS";
    this.props.tile.className = "flagged"
    // debugger;
    this.props.updateGame(this.props.tile, flagging);
  }

  render() {
    // debugger;
    let img;
    // if (this.props.tile.bomb && this.props.tile.reavealed) {
    if (this.props.tile.bombed) {
      img = '💣'
    } else if (this.props.tile.flagged) {
      img = '🚩'
    } else {
      img = '✓'
    }
    
    // let exploredCSS = this.props.tile.explored ? "exploredCSS" : "";
    
    return (
      <div 
        className="tile" 
        onClick={this.handleClick}
        // className={status}
      >
        {img}
      </div>
    )
  }
}

export default Tile;
