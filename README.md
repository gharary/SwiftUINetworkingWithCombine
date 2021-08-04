# SwiftUINetworkingWithCombine
A SwiftUI Netoworking sample with Combine framework.

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Project Explanation](#project-explanation)


## General info
This project is a simple Networking in SwiftUI with using Combine framework.
for the test, I used the `https://jsonplaceholder.typicode.com/` website.
	
## Technologies
Project is created with:
* Xcode version: 12.5
* Swift version: 5.4
* Design Patterns used: MVVM - Combine - SwiftUI

## Setup
To run this project, close it locally and then run.

## Project Explanation
there are five folder in the project.
`App` -- which handles the basic configuration of the project. similar to `SceneDelegate` and `AppDelegate`
`Model` --  which contains the model of the data receive from server
`Network` --  which contains the `API` configuration, networking, fetching data from server
`ViewModel` -- which handles the data and the API
`View` -- which is the view (UI)
