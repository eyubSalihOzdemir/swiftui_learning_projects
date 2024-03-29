![image](https://user-images.githubusercontent.com/55896033/230641673-7e2e9e6d-5e91-450b-a674-51195d30f30e.png)

# What is this?
This is basically my journey of learning Swift & SwiftIU. After some inefficient Udemy courses, I discovered Paul Hudson from [hackingwithswift.com](https://www.hackingwithswift.com/) (GitHub: [HackingWithSwift](https://github.com/twostraws/HackingWithSwift)) and I decided to take on his courses. He has a beautiful course called [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) that teaches something everyday with a total of 19 projects (I'll be adding a few of mine too). But since I have formal experience on mobile application development with Flutter, instead of following that course day to day I just speed up things and practice as much as I can.

# Contents
* [Project 1 - WeSplit](#project-1---weSplit)
* [Project 2 - Guess the Flag](#project-2---guess-the-flag)
* [Project 3 - Views and Modifiers](#project-3---views-and-modifiers)
* [Project 4 - BetterRest](#project-4---betterrest)
* [Project 5 - WordScramble](#project-5---wordscramble)
* [Project 6 - Animations](#project-6---animations)
* [Challenge 1 - RockPaperScissors](#challenge-1---rockpaperscissors)
* [Project 7 - iExpense](#project-7---iexpense)
* [Project 8 - Moonshot](#project-8---moonshot)
* [Project 9 - Drawing](#project-9---drawing)
* [Challenge 2 - KeepTrack](#challenge-2---keeptrack)
* [Challenge 3 - AsynchPractice](#challenge-3---asynchpractice)
* [Project 10 - CupcakeCorner](#project-10---cupcakecorner)
* [Project 11 - Bookworm](#project-11---bookworm)
* [Project 12 - CoreDataProject](#project-12---coredataproject)
* [Challenge 4 - Users](#challenge-4---users)
* [Project 13 - Instafilter](#project-13---instafilter)
* [Project 14 - BucketList](#project-14---bucketlist)
* [Project 15 - Accessibility](#project-15---accessibility)
* [Challenge 5 - RememberPhotos](#challenge-5---rememberphotos)
* [Project 16 - HotProspects](#project-16---hotprospects)
* [Project 17 - Flashzilla](#project-17---flashzilla)
* [Project 18 - LayoutAndGeometry](#project-18---layoutandgeometry)
* [Project 19 - SnowSeeker](#project-19---snowseeker)

## Project 1 - WeSplit

First project of iOS learning series using [Hacking with Swift](hackingwithswift.com)

A check-splitting app to find out what each person needs to pay.

I learned about the fundamental structure of **XCode** and **Swift**, how to get input, how does some of the views work **(Button, Text, TextField, Form, NavigatonBar etc.)** and how to deal with variable states (things like two-way **bindings**).

<img src="https://user-images.githubusercontent.com/55896033/221712511-96774d65-f8f5-4b6c-a759-63503f6e78e4.png" width=20%>

[Scroll to Top](#contents)

## Project 2 - Guess the Flag

An application makes you guess the flags and tells if it's correct or not.

I learned about very important widgets types such as **VStack**, **HStack** and **ZStack**. I learned how **alerts** work on iOS and played with the UI a little bit.

<img src="https://user-images.githubusercontent.com/55896033/222266783-4c03c801-ab1b-40e7-a4dd-c5de0704b5f2.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/222266821-9987fec5-c5b2-4dc3-8a93-13c576060d51.png" width=20%>

[Scroll to Top](#contents)

## Project 3 - Views and Modifiers

A technique project which focuses on **how views and modifiers work**. I've learned that **Structs** are more efficient because they do not have to rely on or inherit from any types of parents (unlike classes), they're a bit more restricting than classes so in a way thay're safer to deal with, easy to use and control. That's why SwiftUI relies heavily on structs other than classes. I learned that modifiers work by copies the existing view and wraps with the new feature we gave, so their **use of order matters** and they can be applied more than once to a view. I also made some code improvements change based on what I've learned on this project.

[Scroll to Top](#contents)

## Project 4 - BetterRest

I've always struggled with dates in Flutter, it was a nigtmare to deal with them. In this project I learned that it is so much easier, better and safer to make the framework do the calculations and logic on **Dates**. I learned about **CoreML** framework and **CreateML** application and used them to make a simple prediction about when the user should go to bed for desired amount of sleep.

<img src="https://user-images.githubusercontent.com/55896033/222541653-cbc59086-cdd9-4783-81ce-d13b96f8af3f.png" width=20%>

[Scroll to Top](#contents)

## Project 5 - WordScramble

In this project I've learned about **List, onAppear modifier, what a Bundle is, fatalError() function, how to use UITextChecker and guard check**.

<img src="https://user-images.githubusercontent.com/55896033/222799843-887a2e1c-6d5d-4f2c-aef4-2883233b9706.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/222800079-54d103fd-d319-46df-a0b8-306195519465.png" width=20%>

[Scroll to Top](#contents)

## Project 6 - Animations

I learned so much about animations. I'll probably forget about most of them but now I know how and where to look when I got something in my mind about animations. I used to have lots of problems in Flutter when it comes to animations but after this project I think if you can get a grasp of how Swift makes the animations work, it'll be a much easier process.

<img src="https://user-images.githubusercontent.com/55896033/222853174-5c3bb274-e2fe-42f7-9475-2e580869b2c2.gif" width=20%>

[Scroll to Top](#contents)

## Challenge 1 - RockPaperScissors

It's a simple practice that's been made without tutorials to practice what I've learned so far. The applications choses a random move (rock, paper or scissors) and generates a result player should achieve (win or lose). Player then should make a move to achieve the desired result.

<img src="https://user-images.githubusercontent.com/55896033/222980425-99b5d3f9-e331-4d2e-973f-525e098728ea.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/222980426-4ef680a9-5bb9-4ec2-93cd-7ccdb9dac8e8.png" width=20%>

[Scroll to Top](#contents)

## Project 7 - iExpense

In this project I experienced with **UserDefaults, Codable property (to be able to archive and unarchive structs), sheet property (to show new screens), onDelete property (to be able to delete rows from lists), @StateObject - @ObservedObject - @Published (to be able to share data between views and watch their state to update the UI)**. Especially the UserDefaults and Codable part was important because I was wondering what Swift was using to achieve same functionality as SharedPreferences on Android. I also learned that Swift do not want developers to rely heavily on UserDefaults because it makes the app launch slower, should use about half a MB at the worst scenario. I also used MVVM and MobX with @Observable states to be able to observe the state shared between views in Flutter but being able to do this in Swift without using any external package and without any boilerplate code is amazing.

<img src="https://user-images.githubusercontent.com/55896033/223476230-edf69827-0293-45d0-af0b-03ee566d3ec2.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/223476269-6df57031-6ed3-4988-91dc-884f24ea2bb3.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/223476303-40f0ba96-c3e8-4555-954c-b2a9bc6cd190.png" width=20%>

[Scroll to Top](#contents)

## Project 8 - Moonshot

This is the most complex app I've built in this series so far. I've used **Geometry Reader to adjust the image size dynamically, experienced with ScrollViews, pushed new screens to the stack, created dynamic layouts based on user's selection and most importantly I've delt with JSON data (encode, decode and load to structs).**

<img src="https://user-images.githubusercontent.com/55896033/224078134-0aa0f8c1-5cd2-4a21-af66-4196405621bf.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/224078182-fb5153e8-d7fe-44f2-977a-6cb78b9aacdb.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/224078235-764fd4dc-d61c-464c-9c00-f2628db3206c.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/224078355-904905fd-308d-4676-89bc-25a8fcaf6b24.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/224078387-1ecf080c-2843-403e-944f-e257c9abc9f7.png" width=18%>

[Scroll to Top](#contents)

## Project 9 - Drawing

**Paths, shapes, strokes, transforms, drawing group, animating values** are a few things that I've learned in this project. On top of **[Project 6 - Animations](#project-6---animations)**, this project was the cherry on the cake. It summed up the visual things for me and has been a good practice. It was heavy in code so it was also a good practice on not just SwiftUI but also on Swift.

<img src="https://user-images.githubusercontent.com/55896033/224438906-f05aea8f-fb2e-4d37-98bd-a481c9a22c04.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/224438918-448c3178-2bda-46a3-884b-05655aaeaa05.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/224439032-a66a0f1e-3177-4231-978e-0d20d4b2a80e.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/224438967-c8b3440b-ebcd-4363-b597-6d38dd4bb9c8.png" width=20%>

[Scroll to Top](#contents)

## Challenge 2 - KeepTrack

This is an app to keep track of how many times you did an activity. UI is definetly not the best of course but I wanted to practice by myself on **dealing with data models, saving & reading data with UserDefaults and manipulating that data between views**.

<img src="https://user-images.githubusercontent.com/55896033/224543633-56460579-b501-4ae1-b05a-e10b7d0b7777.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/224543636-00f271ff-87ae-4e61-9c8e-2566ce8c0eb3.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/224543638-0e4b928e-5337-40d4-bbcd-df1ec4d0901a.png" width=20%>

[Scroll to Top](#contents)

## Challenge 3 - AsynchPractice

I learned **how to deal with network requests** with a simple app using **iTunes API** and **how to load data to object with Codable protocol**. I'll be experimenting on this important subject later on.

<img src="https://user-images.githubusercontent.com/55896033/225342809-a1cf791f-8e81-4b2a-8af8-148185d4404b.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/225342779-e30f4908-78f8-4099-8a43-a5400e97291f.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/225342753-ae974562-dd80-4230-9c32-dc2cc0d52bf4.png" width=20%>

[Scroll to Top](#contents)

## Project 10 - CupcakeCorner

This is a projects that send and receives JSON from the internet. In this project I've created a data model class from scratch using @Published properties and then make adjustments to make it conform to Codable protocol. Then I practiced how to encode the data, send to a server and process the response from that server.

<img src="https://user-images.githubusercontent.com/55896033/226112176-5e0ac1f9-5f50-457f-b5be-036f001e1f0a.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/226112210-57115731-b1c4-48a4-837c-353b14eb434f.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/226112219-f4996ed2-cb3d-4b3e-9cc6-f2c187cbe51c.png" width=20%>

[Scroll to Top](#contents)

## Project 11 - Bookworm

This was a very useful project in order to understand how Core Data simply works to remember user interaction. The next project will go more deeper than this on Core Data.

<img src="https://user-images.githubusercontent.com/55896033/226176266-5b9c5154-da32-4e4f-b724-5852e812323a.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/226176271-3c48885e-b1bd-4639-9f1b-4542d3be5589.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/226176281-951a6cd4-1a2f-4119-a7f5-0bb8c884a217.png" width=20%>

[Scroll to Top](#contents)

## Project 12 - CoreDataProject

We took a look at a little bit more deeper on Core Data. **How to add, delete, sort, filter data and more.**

<img src="https://user-images.githubusercontent.com/55896033/227389785-cafd2dc7-312d-42c5-a1b7-4843270e133c.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/227389854-64c215d7-6719-4547-9e3e-076feede56b4.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/227389863-a2a941b4-0913-4825-bf02-939a46ca1a6e.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/227389869-bd43a1ae-ee43-42bb-bf00-d22b9abf911b.png" width=18%> <img src="https://user-images.githubusercontent.com/55896033/227389879-0912bdef-ab9a-4d2d-b1e6-dd98ae5e80e4.png" width=18%>

[Scroll to Top](#contents)

## Challenge 4 - Users

This was a practice to see if a can make an app that downloads JSON from internet, decodes the data to objects and uses them to present data. In the second part of the project, I tried to save those downloaded users to local cache using Core Data. This way our app would still work even offline.

<img src="https://user-images.githubusercontent.com/55896033/227389955-17906b11-b731-4337-9ebc-9d9b8645e4ab.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/227389968-1ec71d18-4256-4bfc-b042-6c455c9c63f3.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/227389982-aa31f5ff-cf62-4f25-9e04-d8738af1edc3.png" width=20%>

[Scroll to Top](#contents)

## Project 13 - Instafilter

I practiced on CoreImage and learned how to link SwiftUI & UIKit.

<img src="https://user-images.githubusercontent.com/55896033/229590329-4e64c18b-9884-47d6-8497-9ff36692f1a0.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/229590342-629c8e88-3167-4a8c-a780-680cef149b4d.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/229590678-5ec363ea-785b-45d5-91ed-a79af7b78fec.png" width=20%>

[Scroll to Top](#contents)

## Project 14 - BucketList

Things I practiced on in this project: **adding Comparable to custom types, finding the documents directory, integrating MapKit, using biometric authentication, secure Data writing**, and much more.

<img src="https://user-images.githubusercontent.com/55896033/230428085-e4cdc5de-22cf-4912-b8bd-41b5d8322caf.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/230428101-27c2c7df-4fb9-4a3e-8c78-f1ab6d116f9e.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/230428128-bc28de49-55ec-4008-a48b-16ab40ee573e.png" width=20%>

[Scroll to Top](#contents)

## Project 15 - Accessibility

I learned some ways on how to make our apps more accessible so that everyone can use it fully regardless of their individual needs. I wasn't able to build a standalone project for this since iPhone simulators does not support accessibility and I do not have a physical Apple device.

[Scroll to Top](#contents)

## Challenge 5 - RememberPhotos

This is relativly a more simple app compared to the recent projects. But making everything from scratch by myself and combining skills learned on the topics of **MVVM, CoreData, FileManager, PHPickerViewController** made this one a fairly intense project for me. It imports a picture from the library, asks to user to give a name and then saves it to CoreData. The image is saved to documents with the created id, and the id itself is then saved to CoreData.

<img src="https://user-images.githubusercontent.com/55896033/230779097-b5d47b29-dab8-4b51-be94-4ef750e24492.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/230779109-acc7a8e3-3efb-4438-914c-5056d466d738.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/230779115-f3c9fc98-2817-41ed-b218-234c1423db9d.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/230779126-a6132a8b-76d5-4a21-9e82-6715b72cd27f.png" width=20%> 

## Challenge 5.1 - RememberPhotos, Map Update

For a second challenge there was a requirement to implement MapKit to the project. I added a feature to select where the image was taken on a map view and a feature to show that location on the detail screen view.

<img src="https://user-images.githubusercontent.com/55896033/231493148-f833313f-c5d8-453e-bd1c-9064d9ab68c7.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/231493199-fbdde8de-cfa2-461d-99ac-69d616ab0006.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/231493226-d7742396-c858-45b3-a2db-7fd1216342d4.png" width=20%>

[Scroll to Top](#contents)

## Project 16 - HotProspects

Thing I played with: **custom environment objects, TabView, Result, objectWillChange, image interpolation, context menus, local notifications, Swift package dependencies, filter() and map()** and many more.

<img src="https://user-images.githubusercontent.com/55896033/233802122-e4272cdc-e0e3-42ec-8d61-c6c73f8282f9.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/233802126-159489d1-5b56-4a75-969c-514d79bda0ec.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/233802129-97cebb5f-727b-4a7a-985c-49efbd5dddf9.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/233802131-6e72364a-b0ce-4687-88c7-37673dfca0d6.png" width=20%>

[Scroll to Top](#contents)

## Project 17 - Flashzilla

Tha project covered some really great techniques like **gestures, haptics, Combine, and more.**

<img src="https://user-images.githubusercontent.com/55896033/233843682-5c3887a8-9d85-4fe3-b390-1bae53f9064f.png" width=40%> <img src="https://user-images.githubusercontent.com/55896033/233843692-3ef23248-a08a-4e8b-a51b-86c0f5b0be40.png" width=40%>

[Scroll to Top](#contents)

## Project 18 - LayoutAndGeometry

Fndamental knowledge on **how SwiftUI deals with layouts, how views decide what size they need, GeometryReader and creating effects using GeometryReader.**

<img src="https://user-images.githubusercontent.com/55896033/233865661-4522f118-3344-4bcd-ad0f-6dcb0e8cd830.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/233865664-6858afb8-86d7-4a6a-9687-6166802d0f4e.png" width=20%>

[Scroll to Top](#contents)

## Project 19 - SnowSeeker

I learned new skills such as **split view layouts, optional alerts, layout with transparent groups, and even an improved way of formatting lists in text**. It also gave you the chance to practice lots of core skills, such as **handling Codable, creating scrolling lists, and more**.

<img src="https://user-images.githubusercontent.com/55896033/236022330-89a3307e-5647-4f78-ae91-de1ab13de622.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/236022368-ff6153b1-ad5b-4c25-8e78-1d8dd5a734ed.png" width=20%> <img src="https://user-images.githubusercontent.com/55896033/236022391-4d84d86c-27bb-4f10-a287-b5195f073e27.png" width=20%>

[Scroll to Top](#contents)
