class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    $el.append(this.ul);
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li",(event => {
      // console.log("clicked!");
      this.makeMove($(event.currentTarget))
    }))
  }

  makeMove($square) {
    // console.log($square.data("data-pos"));
    if (!this.game.isOver()){
      this.game.playMove($square.data("data-pos"));
      if(this.game.currentPlayer == "x"){
        $square.removeClass();
        $square.addClass("xMove");
        $square.text("X");
      } else {
        $square.removeClass();
        $square.addClass("oMove");
        $square.text("O");
      }
    } 
    
    if (this.game.isOver()){
      let winner = (this.game.currentPlayer === "x") ? "x" : "o";
      console.log(winner);
      if(winner === "x"){
        this.$el.removeClass();
        this.$el.addClass("winner");
        
      } else {

      }
    }
  }

  setupBoard() {
    const ul = $("<ul></ul>");
    for(let i = 0; i < 3; i++){
      for(let j = 0; j < 3; j++){
        const li = $("<li></li>");
        li.data("data-pos", [i,j])
        // const pos = [i, j];
        li.text("");
        // li.append(pos);
        ul.append(li);
      }
    }
    this.ul = ul;
    // this.li = [];

  }
}

module.exports = View;
