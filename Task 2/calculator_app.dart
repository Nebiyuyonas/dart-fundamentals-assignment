// Task 2: Async Calculator App
// Name: Nebiyu Yonas Alemu
// ID: ATE/7602/15

import 'dart:async';

class Calculator {
  final String name; // Stores calculator name

  Calculator(this.name); // Constructor sets the name

  // Add two numbers
  double add(double a, double b) {
    return a + b;
  }

  // Subtract b from a
  double subtract(double a, double b) {
    return a - b;
  }

  // Multiply two numbers
  double multiply(double a, double b) {
    return a * b;
  }

  // Divide a by b (with error check)
  double divide(double a, double b) {
    if (b == 0) {
      // Can't divide by zero
      throw ArgumentError('Cannot divide by zero.'); // Throw error
    }
    return a / b;
  }

  // Simulates a slow network call (takes 1.5 seconds)
  Future<double> computeAsync(double a, double b, String op) async {
    double result;

    // Choose which operation to do based on op string
    switch (op) {
      case 'add':
        result = add(a, b);
        break;
      case 'subtract':
        result = subtract(a, b);
        break;
      case 'multiply':
        result = multiply(a, b);
        break;
      case 'divide':
        result = divide(a, b);
        break;
      default:
        throw ArgumentError('Unknown operation: $op');
    }

    // Wait 1.5 seconds to pretend we're connecting to internet
    await Future.delayed(Duration(milliseconds: 1500));
    return result;
  }

  // Calls computeAsync and prints result (with error handling)
  Future<void> displayResult(double a, double b, String op) async {
    try {
      final result = await computeAsync(a, b, op); // Wait for result
      print('$op($a, $b) = $result'); // Print calculation
    } catch (e) {
      // If error happens (like divide by zero)
      print('Error: $e'); // Print error message instead of crashing
    }
  }
}

Future<void> main() async {
  // Create calculator object
  final calc = Calculator('MyCalculator');

  print('--- ${calc.name} ---');

  // Test all operations (each waits 1.5 seconds)
  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  await calc.displayResult(10, 4, 'divide');
  await calc.displayResult(15, 3, 'divide');

  // Test error handling (division by zero)
  await calc.displayResult(10, 0, 'divide');

  print('All calculations complete');
}

// Conceptual Questions
/*
Q6. Synchronous vs asynchronous functions?

Synchronous functions like divide() finish immediately. When I call divide(10,2) I get 5 right away. Asynchronous functions like computeAsync() take time. I added await Future.delayed to make it wait 1.5 seconds to practice what real apps do when waiting for internet.

Q7. What does await do?

I wrote final result = await computeAsync(...). The await says "wait here until computeAsync finishes, then give me the actual number". If I forget await, result becomes something like "Instance of Future" instead of the real answer 14.0.

Q8. Why use try-catch?

I wrapped my code in try-catch. When I call divide(10,0) it throws an error because you can't divide by zero. The catch catches that error and prints it nicely. Without try-catch, the program would crash and stop completely.

Q9. Why throw error instead of returning 0?

In divide I wrote if (b == 0) { throw ArgumentError... }. I don't print anything inside divide. I just throw the error and let displayResult handle it. divide's job is only to divide numbers, not decide what to do when something goes wrong.

Q10. Why is main() async?

I wrote Future<void> main() async so I can use await inside main() when calling displayResult(). Without async on main, I couldn't use await. I could use .then() instead but it gets messy. async/await makes the code look clean and simple.
*/
