import 'dart:io';
import 'dart:math';
enum Move { Tas, Kagit, Makas }
void main() {
  //User Welcome
  int pcscore = 0;
  int uscore = 0;
  stdout.write("isminizi giriniz : ");
  var username = stdin.readLineSync();
  print("Merhaba  $username! Taş Kağıt Makas oyununa hoşgeldiniz........ ");
  while (true) {
    final tkm = Random();
    //User selection input
    stdout.write(
        'Taş için => T   Kağıt için => K   Makas için M  Çıkış için => Q  GİRİNİZ... ');
    final input = stdin.readLineSync();
    if (input == 'T' || input == 'K' || input == 'M') {
      Move secim;
      if (input == 'T') {
        secim = Move.Tas;
      } else if (input == 'K') {
        secim = Move.Kagit;
      } else {
        secim = Move.Makas;
      }
      //pc get random value
      var random = tkm.nextInt(3);
      var pcsecim = Move.values[random];
      //print the entered selections
      print('GİRİLEN DEĞER: $input');
      print('Seçimin : ${secim.name}');
      print('Pc Seçimi     : ${pcsecim.name}');
      //draw status
      if (secim == pcsecim) {
        print("BERABERE  ");
        print('"BİLGİSAYAR SKOR : $pcscore | $username SKOR : $uscore ");');
      }
      //user wins
      else if (secim == Move.Kagit && pcsecim == Move.Tas ||
          secim == Move.Tas && pcsecim == Move.Makas ||
          secim == Move.Makas && pcsecim == Move.Kagit) {
        print('KAZANDIN !!! $username Tebrikler');
        uscore++;
        print('"BİLGİSAYAR SKOR : $pcscore | $username SKOR : $uscore ");');
      }
      // pc wins
      else {
        print('KAYBETTİN !!! $username bir daha dene');
        pcscore++;
        print('"BİLGİSAYAR SKOR : $pcscore | $username SKOR : $uscore ");');
      }
    }
    //check out
    else if (input == 'Q') {
      break;
    }
    //invalid input
    else {
      print(
          'geçersiz giriş lütfen  taş için T , kağıt için K , makas için M giriniz  !!!!!! ');
    }
  }
}
