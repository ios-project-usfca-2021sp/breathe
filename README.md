# Breathe
## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
[Description of your app]

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
- **Mobile:**
- **Story:**
- **Market:**
- **Habit:**
- **Scope:**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User see app icon in home screen with a styled launch screen.
* User can log in.
* User can log out.
* User can see a list of tasks on the main screen
* User can add a task.
* User can delete a task.
* User can see a motivational section with with healthy quotes/tips.
* User can see a new quote when the button is pressed.

**Optional Nice-to-have Stories**

* User can set a reminder for a task at a certain time.
* User can see different categories of healthy quotes/tips.
* App accesses the Canvas API which will automatically pull assignments from the API instead of creating assignments.

### 2. Screen Archetypes

* The welcome page will be the first initial page the user sees.
   * Along with the welcome page the user will be allowed to sign up.
   * Along with the welcome page the user will be allowed to login.
* The second screen that the user will encounter is the motivation page which consists of quotes and health-based content.

   * The third page the user will interact with is the to-do list page where they add their tasks they want to accomplish.

   * ...

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* On the tab navigation bar the user will be able to go to the motivational screen.

* On the tab navigation bar the user will have the option to go to the to-do list tab.

**Flow Navigation** (Screen to Screen)

* The first initial page the user will see is the motivational page from there the user can click on the to-do list from the navigation bar.

* The second tab on the navigation bar is the to-do list which consists of different components.

   * From the to-do list screen the user is able to add a task that will involve another screen which allows the user to add the details of that task.

## Wireframes
<img src="https://github.com/ios-project-usfca-2021sp/breathe/blob/main/ReadmeRes/wireframe_v1.jpg" width=800 alt="Please contact @mialsy if you cannot see this img">

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
#### List of network requests by each screen:
   - Login screen:
      - post for login
      ```swift
      let username = usernameField.text!
      let password = passwordFiled.text!
        
      PFUser.logInWithUsername(inBackground: username, password: password) {
         (user, error) in
            if user != nil {
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
               print("Error: \(String(describing: error?.localizedDescription))")
            }
      }
      ```
   - Register screen:
      - post for reigister
      ```swift
      let user = PFUser()
      user.username = usernameField.text!
      user.password = passwordFiled.text!

      user.signUpInBackground {
         (success, error) in
            if success {
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
      }
      ```
   - ToDo screen:
      - all actions are local
   - Motivation screen:
      - get motivational quotes
      ```swift
      let query = PFQuery(className:"Quotes")
      query.includeKeys(["quote_id"])
      query.limit = 20
        
      query.findObjectsInBackground {
         (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
      }
      ```
      - get health tips
      ```swift
      let query = PFQuery(className:"Tips")
      query.includeKeys(["tip_id"])
      query.limit = 20
        
      query.findObjectsInBackground {
         (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
      }
      ```