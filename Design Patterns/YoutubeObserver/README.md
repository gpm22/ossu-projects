# Youtube Observer

Youtube allows users to follow their favorite Youtube stars so that they will be notified when the channel is live. This is commonly done using the observer pattern. 

The following UML represents this system:

```
---------------------------------------                 ---------------------------
|            « interface »            |                 |      « interface »      |
|               Subject               |                 |         Observer        |
---------------------------------------                 ---------------------------
| + registerObserver(Observer) : void |                 | + update(String) : void |
| + removeObserver(Observer) : void   |                 ---------------------------
| + notifyObservers() : void          |                              ^^^
---------------------------------------                               |
                  ^^^                                                 |
                   |                                                  |
                   |                                                  |
---------------------------------------                 ----------------------------
|               Channel               |                 |         Follower         |
---------------------------------------                 ----------------------------
| - observers : array (Observer)      |   0..*     0..* | - followerName : String  |
| - channelName : String              |< >------------- ----------------------------
| - status: String                    |                 | + upadate(String) : void |
---------------------------------------                 | + play() : void          |
| + getStatus() : String              |                 ----------------------------
| + setStatus(String) : String        |
| + notifyObservers() : void          |
| + removeObserver(Observer) : void   |
| + notifyObservers() : void          |
---------------------------------------
```