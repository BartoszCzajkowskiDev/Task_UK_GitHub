# Tasks

After all changes, the app should look exactly the same as in the beginning.

Refactor the whole application (do not touch JSONParser, json files, and Networking Manager private methods - let's keep it as a Fake Networking Manager which uses json files included in a project. All the remaining parts of Networking Manager can be changed). You can move parts of the code to separate files, create new classes, change architecture, install additional pods via CocoaPods, etc. I realize that app is really simple, but let's assume this is the beginning of quite a big project.

## Bugs
- Details View change background color after a little delay. We would like to have it immediately when a user enters that screen.
- Details View should also have a title, but it's not displayed at all. Title should be displayed in specific way, for example title "Item1" should be displayed as "ItEm1" (Look at uppercases and lowercases). 
- Going back from Details View moves a user to the initial screen with "Start" button. It's not correct - users should be moved back to Table View Controller.
- Details View always displays downloaded info for ID = "1".
- Table View Controller is not going to be deallocated after going back to Start View Controller

## New Features
- Add another view controller to Tab Bar Controller which displays the same data as a Table View Controller, but using UICollectionView (square cells with assigned background color from data models and label in the center of every cell, two columns).
- Improve Table View Controller - every cell should display name and preview underneath. Cell height should be adjusted to the content, so the cells may have different heights.

## Tests
- Add unit tests to cover the logic part of the app (you do not need to cover the whole logic, please choose some part of it).