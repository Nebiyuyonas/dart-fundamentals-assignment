# Reflection Questions
**Name:** Nebiyu Yonas Alemu
**ID:** ATE/7602/15

**QR1. Which concept was hardest to understand?**

Async/await was the hardest for me. When I forgot to type "await" before computeAsync(), my program printed "Instance of Future" instead of the actual number like 14.0. I was confused at first. Then I learned that async functions don't return values right away - they return a Future which is like a promise that a value will come later. The "await" keyword waits for that promise to give me the real value. The 1.5 second delay also only worked when I used await.

**QR2. Changing List<int> to List<double>**

If I wanted to use decimal numbers like 3.5 instead of whole numbers like 3, I would need to change:
- List<int> to List<double> everywhere
- findMax and findMin to return double instead of int
- The sum variable from int to double
- All numbers from 34 to 34.0, -7 to -7.0, etc.

That's about 10 places I'd have to edit. This taught me that picking the right data type at the beginning saves a lot of work later.

**QR3. Real example of async in Flutter**

A real example is getting weather information from the internet. The app asks a website for the temperature. While waiting for the website to respond, the app shows a loading spinner so the user knows something is happening. When the data comes back, the app displays the temperature. Without async/await, the whole app would freeze and the user couldn't click anything while waiting.

**QR4. Separate methods vs one method**

I made four separate methods (add, subtract, multiply, divide) because each one does one simple thing. If I made one big method with if statements to check which operation to do, it would be messy and harder to fix bugs. But in computeAsync, I did use one method with a switch statement to call the right operation - so I used both approaches. Separate methods are cleaner for the basic math.