local mongo = {}


local function sendHttpRequest(url, method, data)
    local requestData = json.encode(data)

    PerformHttpRequest(url, function(statusCode, response, headers)
        return response
    end, method, requestData, { ['Content-Type'] = 'application/json' })
end

function mongo.connect(connectionString)
    local db = {}
    db.connectionString = connectionString


    function db:addDocument(collectionName, document)
        local url = string.format('%s/%s', self.connectionString, collectionName)
        local response = sendHttpRequest(url, 'POST', document)
        return response
    end

    function db:updateDocument(collectionName, filter, update)
        local url = string.format('%s/%s', self.connectionString, collectionName)
        local query = { filter = filter, update = update }
        local response = sendHttpRequest(url, 'PUT', query)
        return response
    end

    function db:findDocuments(collectionName, filter)
        local url = string.format('%s/%s?filter=%s', self.connectionString, collectionName,
            json.encode(filter))
        local response = sendHttpRequest(url, 'GET', nil)
        return response
    end

    function db:deleteDocuments(collectionName, filter)
        local url = string.format('%s/%s?filter=%s', self.connectionString, collectionName,
            json.encode(filter))
        local response = sendHttpRequest(url, 'DELETE', nil)
        return response
    end

    return db
end

local connectionString = GetConvar('vcore_mongo_connection_string', 'mongodb://localhost:27017/mydatabase')
local db = mongo.connect(connectionString)

return db