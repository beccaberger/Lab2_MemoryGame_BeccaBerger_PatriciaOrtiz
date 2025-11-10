Lab 2 — Memory Game

By: Becca Berger & Patricia Ortiz
Date: October 6, 2025
Class: CIS 128 — iOS App Development (SwiftUI)

Objective

The goal of this lab was to practice building a user interface using different container views in SwiftUI, and to use state properties to control what is displayed on the screen. We built a simple Memory Game that lets players flip cards to find matching pairs.

Description

This app displays a grid of cards featuring pairs of dog images.
Players tap cards to reveal them and try to find matches.

If two revealed cards match, they stay face-up.

If they don’t match, they flip back over after a short delay.

The layout uses LazyVGrid to automatically adjust the number of columns depending on screen size.

The app runs smoothly in both portrait and landscape modes.

Technologies Used

Swift

SwiftUI

State properties (@State, Set, Array)

Animation with DispatchQueue delay

LazyVGrid for responsive layout

GeometryReader for adaptive sizing

What Was Tricky

Some parts that were challenging:

Making the cards flip back automatically after showing two different images.

Managing the state so that matched cards stay visible while others flip back.

Making sure taps are temporarily disabled during the short flip-back delay.

Understanding how to duplicate and shuffle images correctly so pairs appear randomly.

What We Learned

How to use @State and sets/arrays to manage dynamic data in a SwiftUI view.

How to handle user interactions using onTapGesture.

How to control timing with DispatchQueue.main.asyncAfter.

How to structure a game layout that adapts to screen size using LazyVGrid and GeometryReader.

How to Play

Tap any two cards to reveal the dogs.

If they match — they stay visible!

If they don’t — they flip back after a second.

Try to find all pairs!

Future Enhancements

Add a Restart Game button.

Include score tracking or a timer.

Add flip animations for smoother transitions.

Display a “You Win!” message when all pairs are matched.

VIDEO: https://drive.google.com/drive/folders/1UA6W0vjwA4M6oVTVFOxZtWfAoohpIsfU
