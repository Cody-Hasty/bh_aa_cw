const View = require('./ttt-view.js');
const Game = require('./game.js');
window.game = Game;
window.view = View; 
  $(() => {
    // Your code here
    const game = new Game();
    const object = $(".ttt");
    new View(game, object)
  });
