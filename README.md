# Friends with Parse.com
Starter project for setting up a friend relation (including request) with Parse.com and Cocoapods, using Swift. Complete with Podfile. 

## Parse.com
[Parse.com](http://www.parse.com/) is a free (limited requests and storage) NoSQL database hosting service. Set up your application classes accordingly, apart from the standard columns. 

**_User** (usually included from start)
- friends **Relation** to _User

**FriendRequest**
- *toUser* **Pointer** to _User
- *fromUser* **Pointer** to _User
- *status* **String**

#### Cloud Code
As adding a friend means updating two users' *friends* column, Parse Cloud Code must be used (the only user one can modidy on client side is the logged in one). Install Cloud Code by following [this guide]( https://parse.com/docs/ios/guide#command-line-installation).
The Cloud Code itself is included in the project (.js).

Cloud Code and Cloud Call function call was written by and posted to Treehouse forums by [Stone Preston]( https://teamtreehouse.com/stonepreston). I translated the function call from Objective C to Swift.

## Warnings

- As of this version, some parts of the project violate MVC. There are some action and network calls in cells. This will be patched in later versions. 
