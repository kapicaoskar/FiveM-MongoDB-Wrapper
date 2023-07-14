# FiveM-MongoDB-Wrapper
FiveM MongoDB Wrapper with all functions
<br>
**Usage** :
```lua
db:addDocument('VCore', { name = 'John', age = 30 })

db:updateDocument('vcore', { name = 'John' }, { age = 35 })

db:findDocuments('vcore', { age = 30 })

db:deleteDocuments('vcore', { age = 30 })
```
**How to connect** :
<br>
*Add this to fxmanifest.lua*
```lua
server_scripts {
    '@FiveM-MongoDB-Wrapper/server/import.lua',
    'your_scripts_client.lua',
}
```
**Set connection string in Server.cfg**
<br>
*Name of convar to set :* **vcore_mongo_connection_string**
