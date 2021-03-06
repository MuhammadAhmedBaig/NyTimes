# NyTimes
This app shows user the most viewed and most popular articles of New York Times.

# What's in the Readme

* Quick summary
* How do I Clone Project?
* How do I Build Project, Run TestCases & Generate Code Coverage Report?
* Which Architecture is used in the app?
* Improvements for the future.

# Quick summary
A simple app which hits the NY Times Most Popular Articles API and show a list of articles, also show details when items on the list are tapped..
We are using the NYTimes below mentioned API:
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api- key=sample-key

# How do I Clone Project?

- Can be clone by using HTTPS "https://github.com/MuhammadAhmedBaig/NyTimes.git".
- Can be downloaded as Zip.
- Checkout **develop** branch.


# How do I Build Project, Run TestCases?

###### Run Project:

- Open the corresponding ***.xcodeproj*** file.
- Press CMD + R or press "Start the Active Scheme" Button (visually it looks like Play button on left top bar of Xcode)


###### Test Cases:

- Press CMD + U to run all the TestCases.


###### Generate Code Coverage Report:

- To Generate Code coverage report, you first need to enable code coverage from scheme.
- Then you need to run all testcase by pressing CMD + U.
- Go to the "Show the report navigator" from the top-left tab of XCode.
- Go to the "Coverage" and you will see the code coverage report.

# Which Architecture is used in the app?

The app is implementated on MVVM with Clean Arhitecture.

- MVVM -> For the Presentation.
- UseCase -> For the Domain Logic.
- Repository -> For the Data.
- Coordinator -> For App Routing.

###### Few things to understand.
- You may find UIModel which contains only those properties which will help presentation layer to show and pass data.
- UI has been done with programmatic constraints approach.
- Repository and API Calls layer accessed through Dependency Inversion.


# Improvements for the future.

- DI Container can be implemented.
- Local Persistance can also be implemented to improve user experience when internet is not available.
