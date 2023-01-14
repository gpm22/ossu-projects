# Playlist Composite

The goal is to allow the creation of playlists composed of songs and/or other playlists.

UML:

```
------------------------------------------
|              «interface»               |
|              IComponent                |  0..* 
------------------------------------------ -----------------------
| + play(): void                         |                       |
| + setPlaybackSpeed(speed: float): void |                       |
| + getName(): String                    |                       |
------------------------------------------                       |
                   ^^^                                           |
                    |                                            |
                    |                                            |
                    -------------------------------------        |
                                                        |        |
                                                        |        |
                                                        |        |
                                                        |        |
                                                        |        |
------------------------------------------              |        |
|                 Song                   |              |        |
------------------------------------------              |        |
| + String songName                      |              |        |
| + String artist                        |              |        |
| + float speed                          |              |        |
------------------------------------------ --------------        |
| + play(): void                         |              |        |
| + setPlaybackSpeed(speed: float): void |              |        |
| + getName(): String                    |              |        |
| + getArtist(): String                  |              |        |
------------------------------------------              |        |
                                                        |        |
-------------------------------------------             |        |
|                Playlist                 |             |        |
------------------------------------------- -------------        |
| + String playlistName                   |                      |
| + ArrayList<IComponent> playlist        |                      |
------------------------------------------- <>--------------------
| + play() : void                         |
| + setPlaybackSpeed(speed: float) : void |
| + getName() : String                    |
| + add(component: IComponent): void      |
| + remove(component: IComponent) : void  |
-------------------------------------------
```

