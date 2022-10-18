import 'dart:io';
import 'dart:math';

enum Move { Rock, Paper, Scissors }

void main() {
  //User Welcome
  int pcscore = 0;
  int uscore = 0;
  stdout.write("Enter your name : ");
  var username = stdin.readLineSync();
  print("Hello!!!  $username! Welcome to Rock Paper Scissors game");
  while (true) {
    final rnd = Random();
    //User selection input
    stdout.write(
        'For Rock => R     for Paper => P      for Scissors => S        for Quit => ENTER Q... ');
    final input = stdin.readLineSync();
    if (input == 'R' || input == 'P' || input == 'S') {
      Move userMove;
      if (input == 'R') {
        userMove = Move.Rock;
      } else if (input == 'P') {
        userMove = Move.Paper;
      } else {
        userMove = Move.Scissors;
      }
      //pc get random value
      var random = rnd.nextInt(3);
      var pcMove = Move.values[random];
      //print the entered selections
      print('Entered Value: $input');
      print('Your choice : ${userMove.name}');
      print('Pc choice   : ${pcMove.name}');
      //draw status
      if (userMove == pcMove) {
        print("DRAW ! ");
        print('"COMPUTER SCORE : $pcscore | $username SCORE : $uscore ");');
      }
      //user wins
      else if (userMove == Move.Paper && pcMove == Move.Rock ||
          userMove == Move.Rock && pcMove == Move.Scissors ||
          userMove == Move.Scissors && pcMove == Move.Paper) {
        print('YOU WİN  !!! $username CONGRATULATIONS');
        uscore++;
        print('"COMPUTER SCORE : $pcscore | $username SCORE : $uscore ");');
      }
      // pc wins
      else {
        print('YOU LOSE  $username TRY AGAIN');
        pcscore++;
        print('"COMPUTER SCORE : $pcscore | $username SCORE : $uscore ");');
      }
    }
    //check out
    else if (input == 'Q') {
      break;
    }
    //invalid input
    else {
      print(
          'invalid input please enter R for rock, P for paper, S for scissors !!!!!! ');
    }
  }
}
