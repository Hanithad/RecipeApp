**RecipeApp** <br /> <br />
RecipeApp is a SwiftUI application built using the MVVM (Model-View-ViewModel) design pattern. This project demonstrates clean architecture principles, separation of concerns, and modern UI development in iOS.

**Overview** <br /> <br />
This project showcases a SwiftUI-based iOS app that follows the MVVM Architectural design pattern. The app uses:<br />
* SwiftUI for building the UI declaratively.<br />
* MVVM for structuring the app to separate UI, business logic, and data.<br />

**Features** <br /> 
* Clean and modular code with MVVM.<br />
* Asynchronous API calls using URLSession.<br />
* User-friendly error handling and empty state UI.<br />
* Easily scalable and testable structure.<br />


**MVVM Architecture** <br /><br />
**Model** <br />
* Represents the data layer and defines the structure of the app’s data.<br />
* Responsible for parsing JSON and managing persistence (if required).<br />

**View** <br />
* Built with SwiftUI, it focuses purely on UI.<br />
* Observes changes in the ViewModel and updates the UI reactively.<br />

**ViewModel** <br />
* Acts as a middle layer between the View and the Model.<br />
* Fetches and processes data from the Model to prepare it for display.<br />
* Uses @Published and ObservableObject to notify the View of state changes.<br />


**How MVVM is Implemented** <br /> <br />
**1. Recipe List Screen** <br /><br />
ViewModel (RecipeListViewModel) <br />
* Fetches recipes from a remote API. <br />
* Exposes an array of Recipe objects as a @Published property. <br />
* Handles loading and error states. <br />

View (RecipeListView) <br />
* Observes the RecipeListViewModel using @StateObject. <br />
* Displays the recipes in a list format. <br />

**2. Recipe Detail Screen** <br /><br />
View (RecipeDetailView) <br />
* Displays detailed information about a single recipe. <br />
* When onTap, watch on Youtube  redirects to webView. <br />

**3. Networking** <br />
* Centralized API call logic. <br />
* Decodes JSON responses into Swift Codable objects. <br />
* Handles errors like malformed data or network failures <br />


**Screenshots** <br /><br />

**ListView** <br /><br />
<img width="303" alt="Screenshot 2024-11-26 at 8 12 37 AM" src="https://github.com/user-attachments/assets/022149bf-0acb-43c5-a999-a3f261eb7eda"><br />


**DetailView** <br /><br />

<img width="313" alt="Screenshot 2024-11-26 at 8 12 02 AM" src="https://github.com/user-attachments/assets/560327ea-30de-4c51-a12d-e79d9f025761"><br />



**Technologies Used** <br /> <br />

* SwiftUI: Declarative UI framework. <br />
* URLSession: For API calls. <br />
* MVVM: For structuring the app. <br />

