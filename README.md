# Breathe
## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Keeps track of user’s daily tasks/goals and allows them to set reminders throughout the day until their goal has been completed. Will also include a motivational section that will send the user a new motivational quote or video to inspire them every day.

### App Evaluation
- **Category:** Health/Productivity
- **Mobile:** This app would be primarily developed for cell phones, but would perhaps be available for tablets and computers as well. Functionality would be similar across all types of devices with a potential for new features to be added in the future.
- **Story:** Keeps track of user’s daily goals and sends them reminders throughout their day until they have completed the goal. Will also have a motivational tab that will give the user health or motivational tips/videos to help push them to achieve their goals.
- **Market:** Any individual could choose to use this app, and it is great for anyone who is struggling to get things done in their day or needs a place to write everything down.
- **Habit:** This app could be used as often as the user wanted depending on how much they are struggling with getting things done and need some motivation in life.
- **Scope:** First we would start with allowing the user to add their goals and they will be able to set when they want reminders to be sent during the day. The second feature of this app will randomly send the user motivational quotes or videos to help them achieve their goals.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- Database can store user information:
   - [x] Have the parse backend setup with user and todo task table.
- User see app icon in home screen with a styled launch screen.
   - [ ] front end - user can see an app icon and lauch screen.
- User can log in.
   - [x] front end - user can see a login screen.
   - [ ] back end - user can login via login screen. (started)
- User can register.
   - [x] front end - user can see a register screen.
   - [ ] back end - user can create new account via register screen. (started)
- User can log out.
   - [ ] front end - user can see a logout button.
   - [ ] back end - user can logout via logout button.
- User can see a list of tasks on the main screen.
   - [x] front end - user can see a todo task screen.
   - [ ] back end - user can view all added tasks, and check off task on the todo task screen.
- User can add a task.
   - [x] front end - user can see an editing task popover.
   - [x] back end - user can add task on this popover.
   - [x] back end - user can set an alarm which will have a notification.
- User can delete a task.
   - [x] front end - user can see a check box on todo task screen.
   - [ ] back end - user can delete task and disable alarm via check box.
- User can see a motivational section with with healthy quotes/tips.
   - [x] front end - user can see a motivational screen.
   - [ ] back end - user can get random selected motiviational quote and health tips. (started)
- User can see a new quote when the button is pressed.   
   - [ ] front end - user can see a refresh button.
   - [ ] back end - user can get new quotes when pressing button.

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
### Models

|  **Property** | **Type** | **Description** | 
| ------------- | ------------- | ------------- |
|objectId|String|Unique id for the user|
|username|pointer to User|id created for the user|
|task|String|Task that user creates|
|alarm|DateTime|Time for the task to be completed|
|taskDetail|String|Detail of task to be completed|
|taskCount|Number|Number of tasks to be completed|
|createdAt|DateTime|Date when task was created|
|updatedAt|DateTime|Date when task was updated|
|completedAt|DateTime|Date when task was completed|

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
      query.limit = 1
        
      query.findObjectsInBackground {
         (items, error) in
            if item != nil {
                self.quote = items[0]!
                self.tableView.reloadData()
            }
      }
      ```
      - get health tips
      ```swift
      let query = PFQuery(className:"Tips")
      query.includeKeys(["tip_id"])
      query.limit = 1
        
      query.findObjectsInBackground {
         (items, error) in
            if items != nil {
                self.tip = items[0]!
                self.tableView.reloadData()
            }
      }
      ```
