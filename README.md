# iOS Clone: Wordle
## _Can you guess the word?_

¡Hola mundo!

Still learning and practicing lots of Swift, in this repo you're gonna find a clone of Wordle. If you don't now what's Wordle [click here and play it](https://www.nytimes.com/games/wordle/index.html) ⌨️. 

The game is a word game in which you have six tries to guess a five letters word. After each try the letters will change colors, so in gray you will see letters that are **not** part of the word, in yellow those that are on the word but are misplaced and in green the ones that exist and are correctly placed.

**This is my clone in action:**

https://user-images.githubusercontent.com/81619759/159002883-f6dca538-fab3-49e3-826f-9fd630227ad7.mov

## Some Requirements 📋

- Generate a random word
- Check user guess with random word and give color feedback
- Check user guess is an existing word 
- Add a hard mode
- Allow user to change color scheme
- Add statistics to the game
- Make it as close as possible to the original

## Built with 🔨

- XCode
- SwiftUI

## Development ⌨️

I this this following [Stewart Lynch's Wordle Clone tutorial](https://www.youtube.com/watch?v=F43LZVpS-ZQ). And what I liked the most, beyond everything I learnt was how he explained everysingle step. But now, let's dig into the development.

The app logic 🧠 is managed in the WordleDataModel that is used across the app in almost all the views as an EnvironmentObject. Here you can find all the methods that make the game playable such as word verifications, defaults, setting a new game, hardMode methods and the main one: enterWord() that checks the word sended by the user in each try.

As for the screens 📱 the user can interact with four screens so I'll get into each one of them in detail:

### 📱 **Game view** 📱

This is the main one and the most complex of all the screens as is the one where the user plays the game. This view has a toolbar with the game name and a couple of buttons, then we have the rows to write down the words and play and the keyboard. 

#### ❓ **Guess grid** 
As the name states is the area where the user can write down a guess word. The first thing that happens when the user writes down a word is that we check that this word exist in the english dictionary. For doing so we use `UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)` this way the user has to write an actual word each try. If the word does **not** exist the row will shake and a toast message will be displayed 
![Wordle Gifs](https://user-images.githubusercontent.com/81619759/158995059-250dfaf1-018a-4dfd-995b-915334fd7469.gif)

After so we have to check the user guess with the right word. So here comes the trick:
  - If the word is right, 🎉wohooo🎉 the game is over, the cards flip to green color, a celebratory toast message is displayed and the statitics view is displayed.
 
![Wordle Gifs (3)](https://user-images.githubusercontent.com/81619759/158995310-e09c7ffa-bdbe-4a64-91e6-1859f82db114.gif)

  - If the word is wrong, 😥bohooo😥 you can try again. Now we have to check letter by letter so when the card flip it changes it color: gray for wrong letter, yellow for misplaced letter and green for right. After this attempt the user will be able to try again in the next row until it completes six tries
  
![Wordle Gifs (1)](https://user-images.githubusercontent.com/81619759/158995220-0f43670c-072a-401f-b6ff-7401b0c8ba24.gif)

#### ⌨️ **Keyboard** 
The second part of the game view is the keyboard. We have created our own keyboard with some rules into it. For doing so we created a LetterButtonView (for each key) that get's a letter as parameter and then we made a KeyboardView with ForEach loops to render the keyboard rows. All the logic is again managed in the data model that is being use as an EnvironmentObject. The keyboard rules are:

  - User cannot send any word with less than 5 letters.
  - Letters background color will change just as the cards. So if the user uses a letter that does not exist the background will change to gray, misplaced will be yellow and right will be green.
  
![Wordle Gifs (2)](https://user-images.githubusercontent.com/81619759/158995085-c7e545ee-a063-46d9-9afa-01d6c4c7b724.gif)

#### 🛠️ **Toolbar** 
Last but not least we have the toolbar. As we expect this is for user navigation and it allows the user to start a new game once the game is over, see the game rules, check the statistics and go to it's settings.

![Screenshot 2022-03-18 at 12 19 42](https://user-images.githubusercontent.com/81619759/158994090-856cf33b-b85b-4d99-9d32-224216fabd8f.png)

#### 🎯 **How to play** 🎯 

Beyond the game view all the other views that the user can interact with are part of the toolbar. The first one is the "How to play" that is represented with the interrogation mark. This view has no logic it only shows the instructions to actually play the game.

#### 🏆 **Statistics** 🏆 

As it's implied in this view the user will be able to see the game statistics and can also share the results of it's last game. This view is presented as a `.sheet` each time the user finishes a game or everytime it clicks on the statistics button in the toolbar and portrays the next data:
- Played: How many games has been played 
- Win %: The percentage of games that has been able to finish within the six tries
- Current streak: How many games has won in a row
- Max streak: Best streak that has registered
- Guess distribution: Shows how many times has won in each try.
- Share button: To share the data

<img src="https://user-images.githubusercontent.com/81619759/158998350-dbba6f89-d2aa-43ad-bad4-fa08d2bdbe46.png" alt="" width="150"> 

<img src="https://user-images.githubusercontent.com/81619759/158998469-5830a44b-1256-4226-b89f-d08a910a9174.png" alt="" width="250"> <img src="https://user-images.githubusercontent.com/81619759/158998477-fecb86fd-1c3f-4ce7-996b-2f9d0326d7c8.png" alt="" width="250">

#### ⚙️ **Settings** ⚙️ 

In this area the user can customize it's game experience either changin the game theme into dark, light or keeping it according to it's system configuration. This was done with a ColorSchemeMaganer that get's the user preference and override the UserInterfaceStyle. 
And also they can enable the hardmode. Hard Mode game changes the title into a scary red color but also changes the game rules as after the user finds a letter missplaced or right, it **must** use them always.

If misplaced the user **must** reuse the letter somewhere in the next try, if the letter is correctly placed it **must** be use in the right place now and foremost until it guesses the right word. If the user tries to skip the rules a toast will appear indicating that they must use the letter.

https://user-images.githubusercontent.com/81619759/159000887-c677375c-c0b2-4817-ba58-d2238c8d9a85.mov


### My challenges 🚩

This is a really complete and challenging exercise. For so after finishing it I decided to check some things used in the logic and gathered them -in spanish- in a notion that [you can check here](https://laced-thief-bc5.notion.site/Ejercicio-Wordle-apuntes-0414fcfc71d7471b94a39872ae136e30).

Some of the concepts are the use of property wrappers such as @AppStorage and @Environment. The didSet and willSet property observers, the differences between Map, FlatMap and CompactMap and so on.

## Want to fork this repo? 🐑

If you want to you can fork this repo to play around. However I strongly recommend to see [Stewart Lynch's tutorial](https://www.youtube.com/watch?v=F43LZVpS-ZQ) as it's clear like water and you are going to learn a lot
