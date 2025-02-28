# ContactsApp

## Overview
ContactsApp enables you to manage your contacts efficiently. It displays a list of contacts, supports real-time search, and allows you to add new contacts or update existing ones. The app uses swipe actions for deletion and offers separate views for contact registration and detail editing.

## Features
- **Contact List & Search:**  
  View and search through a list of contacts.
- **Add New Contact:**  
  Register new contacts via a dedicated registration page.
- **Contact Details:**  
  View and update detailed contact information.
- **Swipe Actions:**  
  Delete contacts using swipe gestures on the list.
- **Custom UI Components:**  
  Uses custom table view cells for an enhanced display.

## Technologies (Architecture)
- **Swift:** Primary programming language.
- **UIKit:** For building the user interface.
- **MVC Pattern:** Organized using the Model-View-Controller design.
- **Delegation:** Implements delegation for handling user interactions (e.g., search, table view actions).

## Project Structure
- **AppDelegate.swift:**  
  Manages the application lifecycle.
- **SceneDelegate.swift:**  
  Handles window and scene management.
- **MainPage.swift:**  
  Displays the contacts list, integrates search functionality, and manages swipe actions.
- **PersonDetails.swift:**  
  Shows detailed information of a selected contact and allows updates.
- **PersonRegistration.swift:**  
  Provides a form to add new contacts.
- **TableViewCell.swift:**  
  Custom table view cell for displaying contact name and phone number.
- **Persons.swift:**  
  Defines the contact model used throughout the app.

----------------------------------------------------------------------------------------------------------------
## Setup
1. Clone the repository:
   ```bash
   git clone <repository-url>
