# Milestone 1 - Overview

## Kosmic Dashboard
---
- Purchased a designer to create majority of the pages I needed
  - I did have ALOT of complications and didnt even start getting any work until well over a month of order time. Also designs are on a single layer so I'm having to recreate each page from scratch so that I can output it properly for coding. (Takes roughly a week per page to recreate it, the way i need it.)

- Tasks Completed
  - Converted Home page design to code
  - Added functionality to Sidebar /w subMenu
  - Added functionality to Header:
    - Links go to proper locations with proper url changes
    - Queries NCG from public id
    - Quick Copy Button
  - Added functionality to News Article components
  - Added functionality to Leaderboards: Most Experienced & Top PvP
  - Added functionality to some Network Cards:
    - Average Block Difficulty
    - Total Blocks
    - Total NCG Created
  - CharacterPeek
    - XP: Partially
    - AP
  - Backend
    - Setup routing tables
    - Prepared resources for future modules
    - Designed a completely dockerized work environment
    - Easy preview using dockerized environment
  - Documentation: https://github.com/CryptoKasm/9c-kosmic-dashboard

- Incomplete
  - Sidebar:
    - Lock Button: Requires the development of a login system
    - Refresh Button: Requires closer integration to new 9c-swarm-manager project to force initate a snapshot resync function
  - Header
    - Buy, Sell, Transfer: These arent working for obvious reasons, but planned ahead
    - Notifications: Requires the development of a notifications system unique to the entirety of the Kosmic Dashboard
  - Network Cards
    - Average Block Time: Working on this
    - Daily Transactions: Functionality doesnt exist on graphql
    - Active Player Addresses: Functionality doesnt exist on graphql
    - Total Transactions: Functionality doesnt exist on graphql
    - Total Player Addresses: Functionality doesnt exist on graphql
  - CharacterPeek
    - XP: Couldn't figure out how this was calculated as the xp requirement changes at different levels **(need help from devs)**
    - Prosperity: Couldn't figure out how this was calculated **(need help from devs)**
    - Blacksmithing: Functionality doesnt exist on graphql
    - Mailbox: Only displays a long id, no idea what it links to? **(need help from devs)**

<br>

## Swarm Manager
---
- Ive put a lot of time into developing this new project, which combines the 9c-swarm-miner and the 9c-node-manager into a single project that will actively be improved on and integrated more closely into the dashboard. This will allow more control with the node/miner without needing coding knowledge as you'll be able to configure and control it from within a panel on the dashboard.
- Documentation: https://github.com/CryptoKasm/9c-swarm-manager
- I have yet to release it publically because I'd like to get the hardware to do extensive development before having to deal with questions when its still in progress.

