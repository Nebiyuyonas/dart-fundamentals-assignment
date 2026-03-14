// Task 1: Number Analysis App
// Name: Nebiyu Yonas Alemu
// ID: ATE/7602/15

// Finds the biggest number in the list
int findMax(List<int> numbers) {
  int max = numbers[0]; // Start with first number
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] > max) {
      // If current number is bigger
      max = numbers[i]; // Update max to that number
    }
  }
  return max;
}

// Finds the smallest number in the list
int findMin(List<int> numbers) {
  int min = numbers[0]; // Start with first number
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] < min) {
      // If current number is smaller
      min = numbers[i]; // Update min to that number
    }
  }
  return min;
}

// Adds up all numbers in the list
int calculateSum(List<int> numbers) {
  int sum = 0; // Start from zero
  for (int i = 0; i < numbers.length; i++) {
    sum = sum + numbers[i]; // Add each number to sum
  }
  return sum;
}

// Calculates average by reusing the sum function
double calculateAverage(List<int> numbers) {
  int sum = calculateSum(numbers); // Get total from function above
  double average = sum / numbers.length; // Divide by how many numbers
  return average;
}

// Bonus: Counts how many numbers are negative
int countNegatives(List<int> numbers) {
  int count = 0; // Start count at zero
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] < 0) {
      // If number is less than zero
      count++; // Add one to count
    }
  }
  return count;
}

void main() {
  // List of numbers to analyze (at least 8 with positive and negative)
  List<int> numbers = [34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  // Call each function and store results
  int maxValue = findMax(numbers);
  int minValue = findMin(numbers);
  int sumValue = calculateSum(numbers);
  double averageValue = calculateAverage(numbers);
  int negativeCount = countNegatives(numbers);

  // Print results
  print('--- Number Analysis Results ---');
  print('Numbers: $numbers');
  print('Maximum: $maxValue');
  print('Minimum: $minValue');
  print('Sum: $sumValue');
  print('Average: $averageValue');
  print('Negative numbers: $negativeCount');
}

// Conceptual Questions
/*
Q1. What is the difference between List<int> and List<dynamic>?

In my code I used List<int> numbers = [34, -7, 89...]. This means only integers can go in this list. List<dynamic> would let me put anything - numbers, words, true/false. List<int> is better because if I accidentally try to add a word, Dart tells me before I run the program.

Q2. Why start max with first element instead of 0?

In findMax I wrote int max = numbers[0]. If I used 0 instead and my list was all negative numbers like [-5, -10, -3], the function would compare each number with 0. Since all are less than 0, max stays 0 and the function returns 0 which isn't even in the list. Starting with first element guarantees I compare with a real number from my list.

Q3. Why does calculateAverage call calculateSum?

In calculateAverage I wrote int sum = calculateSum(numbers). I didn't write another loop to add numbers again. This is called DRY (Don't Repeat Yourself). If I need to fix how sum works later, I only change calculateSum once and calculateAverage automatically uses the fix.

Q4. Traditional for loop vs for-in loop?

I used for (int i = 0; i < numbers.length; i++). This gives me an index i that I can use to get each number with numbers[i]. A for-in loop (for int num in numbers) gives me each number directly without an index. I used traditional loop because I just needed to check each value - both work the same for what I'm doing.

Q5. What happens with an empty list?

If someone passes an empty list [] to findMax, my code would crash trying to read numbers[0] because nothing exists there. To fix this I could add if (numbers.isEmpty) return 0; at the top. This checks for empty list first and returns 0 instead of crashing.
*/
