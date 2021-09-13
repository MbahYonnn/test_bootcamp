import 'dart:ffi';
import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() {
  print("SELAMAT DATANG");
  print(
      "MENU:\n 1.Palindrome \n 2.Leap Year \n 3.Reverse Words \n 4.Nearest Fibonacci \n 5.FizzBuzz");
  stdout.write("Pilih: ");

  // Scanning number
  int? n = int.parse(stdin.readLineSync()!);
  // Here ? and ! are for null safety
  var value = n;

  switch (value) {
    case 1:
      {
        print('Enter Words or number');
        // User enter a string or a number
        String? original = stdin.readLineSync();

        // then we will reverse the input
        String? reverse = original!.split('').reversed.join('');

        // then we will compare
        if (original == reverse) {
          print('Its A Palindrome');
        } else {
          print('Its A Not Palindrome');
        }
      }
      break;

    case 2:
      {
        stdout.write("Enter Start Leap Year Range: ");
        int? start_leap = int.parse(stdin.readLineSync()!);
        stdout.write("\nEnter End Leap Year Range: ");
        int? end_leap = int.parse(stdin.readLineSync()!);
        for (int year = start_leap; year <= end_leap; year++) {
          if (year % 4 == 0) {
            if (year % 400 == 0) {
              stdout.write("$year, ");
            }
            stdout.write("$year, ");
          }
        }
      }
      break;
    case 3:
      {
        stdout.write("Input word to be reversed: ");
        String? origin = stdin.readLineSync();
        stdout.write("\nThe Reversed Word is: ");
        String? reversedword = origin!.split('').reversed.join();
        stdout.write("\n$reversedword");
      }
      break;
    case 4:
      {
        stdout.write("Input fibo: ");
        int? fibo = int.parse(stdin.readLineSync()!);
        if (fibo == 0) {
          stdout.write(0);
          return;
        }
        int? a = 15;
        int? b = 1;
        int? c = 3;
        var Array = [a, b, c];

        int? ans = (b.abs() - fibo >= b.abs() - fibo) ? b : c;
        int? so = fibo - ans;
        print('$so');
      }
      break;
    case 5:
      {
        stdout.write("Input FizzBuzz: ");
        int? buzz = int.parse(stdin.readLineSync()!);
        int? i;
        for (i = 1; i! <= buzz; i++) {
          if (i % 15 == 0)
            stdout.write("FizzBuzz\t");

          // number divisible by 3? print 'Fizz'
          // in place of the number
          else if ((i % 3) == 0)
            stdout.write("Fizz\t");

          // number divisible by 5, print 'Buzz'
          // in place of the number
          else if ((i % 5) == 0)
            stdout.write("Buzz\t");
          else {
            stdout.write('$i\t');
          }
        }
      }
      break;

    default:
      {
        print("welp");
      }
      break;
  }
}
