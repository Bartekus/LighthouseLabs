## Objectives

### 1. Read the code

1. What is the responsibility of the Browser class?
A. The primary function is that of a view component of the model-view-controller [ MVC ] design, 
    defining the interaction of requesting information from the model that it uses to generate an output  representation to the user. 
    In absence of properly defined controller component, the secondary function of the Browser class is that of a Controller, 
    which is defined as sending commands to the model to update the model's state (e.g., editing a document). 
    Furthermore, it can also send commands to its associated view to change the view's presentation of the model (e.g., by scrolling through a document).

2. What is the responsibility of the HTMLPage class?
A. The responsibility of the HTMLPage class is to play the role of the Model in MVC software architectural pattern (for implementing user interfaces).

3. Why are the 2 classes inside a module? 
A: [Technically there is only one class but there should be two since we are dealing with two different concerns, that of a controller and that of a view. 
    As per MVC model these concerns should be separated into two classes.]

4. Is the Browser class code readable? What would you change/improve?
A: Is syntax is quite readable but once separated into two classes I would add appropriate descriptions as to militarize the amount of time necessary to learn the functional purpose of the code.

5. What is Nokogiri and why is the HTMLPage class using it?
A: Nokogiri is a open source Ruby library that is used to parse XML and HTML documents. 

6. Why does the `content` method in HTMLPage do this? `@content ||=`
A: It assigns the default value for 'content' as return of the Nokogiri::HTML(@html) method in absence of existing content value.

7. How come the Browser doesn't have to fully qualify the HTMLPage class name (`LightBrow::HTMLPage`) when referring to it?
A: Since both of the files are children of the same namespace (domain) parent, they can refer to each other without having to specify the parent (host) namespace.

### 2. Implement

In the Browser class, the `fetch` method needs to be implemented. Currently it always returns nil which causes the program to assume that the user entered URL was invalid: <http://d.pr/i/wsKv/2OAvo6Yz>.

Once you implement it to fetch the URL and return the HTTP response, the browser should work as advertised.

### 3. Error Handling

What if the URL entered by the user is malformed or not a valid HTTP url? `fetch` should return nil instead of the response object.

### 4. Enhancement - History

Add the ability to store browser history (the urls that were visited). Commands: `\h`, `\f` and `\b`. We'd like it to work similar to how a real browser handles history:
* Show history in reverse chronological order
* Back command fetches the last visited page again
* Going back again means you can go forward twice
* Attempting to go forward when you're at the most current/recent URL is not possible (tell the user to stuff it)

We might as well store the URLs visited by the user in the database.

**Think about the following:**

1. What model(s) / table(s) should you create?
2. What should the fields/attributes be?

**You'll probably want to:**

* Add ActiveRecord support
* Use SQLite3 (add the gem, establish a connection to the db)
* Put your models in `app/models` folder
* Add rake commands to be able to create, drop, migrate the db

Hint: Refer to and perhaps even bring in files/code from your previous project to save on time.

### 5. Enhancement - Visit links _(Bonus)_

Allow the user to navigate to the links that are listed after visiting a page.

Given the following scenario, the user would be able to enter the command `\v 1` to visit link #1, taking them to `https://github.com/`. If they entered `\v 2` that would take them to `https://github.com/join`.

Think about the different types of URLs you have to deal with here:
1. Absolute URLs (eg: `https://github.com/`)
2. Relative URLs from the root of the domain (eg: `/join`)
3. Relative URLs from the current page (eg `news`)
