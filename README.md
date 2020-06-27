# Farm & Production System
It is a simple script developed to FiveM that allow you to create farms and productions places anywhere around the map.

 - Easy to set up
 - Easy to change
 
 **Features**:
 - Play animation during the process
 - Recipe system
 - Custom display text
 - Permissions

 **Dependencies**:

 - vrp_notify (could be changed for any another one)
 - vrp_emotes

# How to install

 1. Download, unzip and move folder **gmz_production** to **[resources]/**
 2. start gmz_production

# How to setup

Open **config.lua**
Follow the instructions to add a new place of farm:
 
|       Variable         |Description                          |Variable Type                         |
|----------------|-------------------------------|-----------------------------|
|x|`relative coordination X`            |double            |
|y|`relative coordination Y`            |double            |
|z|`relative coordination Z`            |double            |
|text|`text to show when get close to position`            |string            |
|marker|`show up a green marker in farm position`            |boolean|
|duration|`time to end the farm in seconds`            |int            |
|anim|`play animations during the farm (vrp_emotes is necessary)`            |string            |
|permissions|`need permissions to product?`            |string array            |
