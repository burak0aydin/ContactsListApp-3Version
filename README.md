# ContactsApp

## Overview
ContactsApp enables you to manage your contacts efficiently. It displays a list of contacts, supports real-time search, and allows you to add new contacts or update existing ones. The app uses swipe actions for deletion and offers separate views for contact registration and detail editing.

## Features
- **Contact List & Search:** View and search through a list of contacts.
- **Add New Contact:** Register new contacts via a dedicated registration page.
- **Contact Details:** View and update detailed contact information.
- **Swipe Actions:** Delete contacts using swipe gestures on the list.
- **Custom UI Components:** Uses custom table view cells for an enhanced display.

## Technologies (Architecture)
- **Swift:** Primary programming language.
- **UIKit:** For building the user interface.
- **MVC Pattern:** Organized using the Model-View-Controller design.
- **Delegation:** Implements delegation for handling user interactions (e.g., search, table view actions).

## Project Structure
- **AppDelegate.swift:** Manages the application lifecycle.
- **SceneDelegate.swift:** Handles window and scene management.
- **MainPage.swift:** Displays the contacts list, integrates search functionality, and manages swipe actions.
- **PersonDetails.swift:** Shows detailed information of a selected contact and allows updates.
- **PersonRegistration.swift:** Provides a form to add new contacts.
- **TableViewCell.swift:** Custom table view cell for displaying contact name and phone number.
- **Persons.swift:** Defines the contact model used throughout the app.

----------------------------------------------------------------------------------------------------------------

# ContactsApp

## Overview
ContactsApp demonstrates a clean separation of concerns using the MVVM pattern along with a Repository layer for data management. The app features a dynamic contacts list that updates reactively, providing a smooth user experience.

## Features
- **View Contacts:** Display a list of contacts with names and phone numbers.
- **Search:** Real-time search functionality to filter contacts.
- **Add New Contact:** Register a new contact using a dedicated registration screen.
- **Update Contact Details:** Edit contact information on a details screen.
- **Delete Contact:** Remove a contact via swipe actions.
- **Reactive Updates:** Automatically update the contacts list using RxSwift.

## Technologies (Architecture)
- **Swift:** Primary programming language.
- **UIKit:** For building the user interface.
- **MVVM Pattern:** Separates UI logic from business logic.
- **RxSwift:** Provides reactive programming capabilities.
- **Repository Pattern:** Encapsulates data access and management.

## Project Structure
- **AppDelegate.swift:** Manages the application lifecycle.
- **SceneDelegate.swift:** Handles the app’s window and scene management.
- **MainPage.swift:** Main view controller that displays the contacts list and integrates search functionality.
- **MainPageViewModel.swift:** Contains the business logic for the main page. It uses RxSwift to provide a reactive list of contacts.
- **PersonDetails.swift:** Displays detailed information of a selected contact and allows updates.
- **PersonDetailsViewModel.swift:** Handles updating contact information via the repository.
- **PersonRegistration.swift:** Provides a form to add new contacts.
- **PersonRegistrationViewModel.swift:** Manages the logic for saving new contacts.
- **TableViewCell.swift:** Custom table view cell used to display contact name and phone number.
- **Persons.swift:** Defines the model for a contact.
- **PersonDaoRepository.swift:** Implements data management operations (save, update, delete, search, and upload) using RxSwift for reactive updates.

----------------------------------------------------------------------------------------------------------------

## Setup
1. Clone the repository:
   ```bash
   git clone <repository-url>
