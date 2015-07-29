function placeBet() {
  'use strict';
  var bet;
  while (+bet % 1 !== 0 || +bet === 5 || +bet === 10) {
    bet = prompt('Place your bet now!\nOnly $5 or $10 please.');
    if (+bet % 1 !== 0 || +bet !== 5 || +bet !== 10) {
      alert('Only $5 or $10!');
      placeBet();
    };
  };
  return +bet;
};

function guessNumber() {
  'use strict';
  var guess;
  while (+guess % 1 !== 0 || +guess < 1 || +guess > 10) {
    guess = prompt('Guess a number between 1 and 10.');
    if (+guess % 1 !== 0 || +guess < 1 || +guess > 10) {
      alert('Your guess must be an integer between 1 and 10 please!');
    };
  };
  return +guess;
};

function playGame() {
  'use strict';
  alert("Welcome to JavaScript Betting Game!");
  var bank = 100;
  while (bank > 0) {
    var bet = placeBet();
    var guess = guessNumber();
    var number = Math.floor(Math.random() * 10 + 1);
    if (guess === number) {
      console.log(number);
      alert("Congratulations! You've guessed correctly!");
      bank = bank + bet;
    } else if (Math.abs(number - guess) === 1) {
      console.log(number);
      alert("Almost! However the correct answer was: " + number + ".\nTherfore $" + bet + " is refunded back to you.");
    } else {
      console.log(number);
      alert("That's incorrect! The number was " + number + "!\nBetter luck next time!");
      bank = bank - bet;
    };
    if (bank > 0) {
      alert("Currrently you have $" + bank);
    } else {
      alert("Game Over! You are out of money!");
    };
  };
};

playGame();
