# Friends-with-Parse
Starter project for setting up a friend relation (including request) with Parse.com and Cocoapods, using Swift. Complete with Podfile. 

## Parse.com
Parse.com is a free (limited requests and storage) NoSQL database hosting website. Set up your application classes accordingly, apart from the standard columns. 

**_User** (usually included from start)
- friends **Relation** to _User

**FriendRequest**
- *toUser* **Pointer** to _User
- *fromUser* **Pointer** to _User
- *status* **String**

##### Cloud Code
As adding a friend means updating two users' *friends* column, Parse Cloud Code must be used (the only user one can modidy on client side is the logged in one). Install Cloud Code by following this guide https://parse.com/docs/ios/guide#command-line-installation
The Cloud Code itself is included in the project (.js).
