# What is this?
This is basically my journey of learning Swift & SwiftIU. After some inefficient Udemy courses, I discovered Paul Hudson from [hackingwithswift.com](hackingwithswift.com) and I decided to take on his courses. He has a beautiful course called [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) that teaches something everyday with a total of 19 projects (I'll be adding a few of mine too). But since I have formal experience on mobile application development with Flutter, instead of following that course day to day I just speed up things and practice as much as I can.

# Contents
* [Project 1 - WeSplit](#Project-1---WeSplit)
* [Project 2 - Guess the Flag](#Project-2---Guess-the-Flag)
* [Project 3 - Views and Modifiers](#Project-3---Views-and-Modifiers)
* [Project 4 - BetterRest](#project-4---betterrest)
* [Project 5 - WordScramble](#project-5---wordscramble)
* [Project 6 - Animations](#project-6---animations)
* [Practice 1 - RockPaperScissors](#practice-1---rockpaperscissors)
* [Project 7 - iExpense](#project-7---iexpense)
* [Project 8 - Moonshot](#project-8---moonshot)
* [Project 9 - Drawing](#project-9---drawing)

## Project 1 - WeSplit

First project of iOS learning series using [Hacking with Swift](hackingwithswift.com)

A check-splitting app to find out what each person needs to pay.

I learned about the fundamental structure of **XCode** and **Swift**, how to get input, how does some of the views work **(Button, Text, TextField, Form, NavigatonBar etc.)** and how to deal with variable states (things like two-way **bindings**).

<img src="https://user-images.githubusercontent.com/55896033/221712511-96774d65-f8f5-4b6c-a759-63503f6e78e4.png" width=20%>

## Project 2 - Guess the Flag

An application makes you guess the flags and tells if it's correct or not.

I learned about very important widgets types such as **VStack**, **HStack** and **ZStack**. I learned how **alerts** work on iOS and played with the UI a little bit.

<img src="https://user-images.githubusercontent.com/55896033/222266783-4c03c801-ab1b-40e7-a4dd-c5de0704b5f2.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/222266821-9987fec5-c5b2-4dc3-8a93-13c576060d51.png" width=20%>

## Project 3 - Views and Modifiers

A technique project which focuses on **how views and modifiers work**. I've learned that **Structs** are more efficient because they do not have to rely on or inherit from any types of parents (unlike classes), they're a bit more restricting than classes so in a way thay're safer to deal with, easy to use and control. That's why SwiftUI relies heavily on structs other than classes. I learned that modifiers work by copies the existing view and wraps with the new feature we gave, so their **use of order matters** and they can be applied more than once to a view. I also made some code improvements change based on what I've learned on this project.

## Project 4 - BetterRest

I've always struggled with dates in Flutter, it was a nigtmare to deal with them. In this project I learned that it is so much easier, better and safer to make the framework do the calculations and logic on **Dates**. I learned about **CoreML** framework and **CreateML** application and used them to make a simple prediction about when the user should go to bed for desired amount of sleep.

<img src="https://user-images.githubusercontent.com/55896033/222541653-cbc59086-cdd9-4783-81ce-d13b96f8af3f.png" width=20%>

## Project 5 - WordScramble

In this project I've learned about **List, onAppear modifier, what a Bundle is, fatalError() function, how to use UITextChecker and guard check**.

<img src="https://user-images.githubusercontent.com/55896033/222799843-887a2e1c-6d5d-4f2c-aef4-2883233b9706.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/222800079-54d103fd-d319-46df-a0b8-306195519465.png" width=20%>

## Project 6 - Animations

I learned so much about animations. I'll probably forget about most of them but now I know how and where to look when I got something in my mind about animations. I used to have lots of problems in Flutter when it comes to animations but after this project I think if you can get a grasp of how Swift makes the animations work, it'll be a much easier process.

<img src="https://user-images.githubusercontent.com/55896033/222853174-5c3bb274-e2fe-42f7-9475-2e580869b2c2.gif" width=20%>

## Practice 1 - RockPaperScissors

It's a simple practice that's been made without tutorials to practice what I've learned so far. The applications choses a random move (rock, paper or scissors) and generates a result player should achieve (win or lose). Player then should make a move to achieve the desired result.

<img src="https://user-images.githubusercontent.com/55896033/222980425-99b5d3f9-e331-4d2e-973f-525e098728ea.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/222980426-4ef680a9-5bb9-4ec2-93cd-7ccdb9dac8e8.png" width=20%>

## Project 7 - iExpense

In this project I experienced with **UserDefaults, Codable property (to be able to archive and unarchive structs), sheet property (to show new screens), onDelete property (to be able to delete rows from lists), @StateObject - @ObservedObject - @Published (to be able to share data between views and watch their state to update the UI)**. Especially the UserDefaults and Codable part was important because I was wondering what Swift was using to achieve same functionality as SharedPreferences on Android. I also learned that Swift do not want developers to rely heavily on UserDefaults because it makes the app launch slower, should use about half a MB at the worst scenario. I also used MVVM and MobX with @Observable states to be able to observe the state shared between views in Flutter but being able to do this in Swift without using any external package and without any boilerplate code is amazing.

<img src="https://user-images.githubusercontent.com/55896033/223476230-edf69827-0293-45d0-af0b-03ee566d3ec2.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/223476269-6df57031-6ed3-4988-91dc-884f24ea2bb3.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/223476303-40f0ba96-c3e8-4555-954c-b2a9bc6cd190.png" width=20%>

## Project 8 - Moonshot

This is the most complex app I've built in this series so far. I've used **Geometry Reader to adjust the image size dynamically, experienced with ScrollViews, pushed new screens to the stack, created dynamic layouts based on user's selection and most importantly I've delt with JSON data (encode, decode and load to structs).**

<img src="https://user-images.githubusercontent.com/55896033/224078134-0aa0f8c1-5cd2-4a21-af66-4196405621bf.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/224078182-fb5153e8-d7fe-44f2-977a-6cb78b9aacdb.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/224078235-764fd4dc-d61c-464c-9c00-f2628db3206c.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/224078355-904905fd-308d-4676-89bc-25a8fcaf6b24.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/224078387-1ecf080c-2843-403e-944f-e257c9abc9f7.png" width=18%>

## Project 9 - Drawing

**Paths, shapes, strokes, transforms, drawing group, animating values** are a few things that I've learned in this project. On top of **[Project 6 - Animations](#project-6---animations)**, this project was the cherry on the cake. It summed up the visual things for me and has been a good practice. It was heavy in code so it was also a good practice on not just SwiftUI but also on Swift.