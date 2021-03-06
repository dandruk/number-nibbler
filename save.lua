local json = require("dkjson.dkjson")

local save = {}
save.file_path = "number_nibbler_data.json"
save.data_read = false

function save:read_data()
  local data = {}
  if love.filesystem.exists(self.file_path) then
    local data_json = love.filesystem.read(self.file_path)
    data = json.decode(data_json)
  end
  self.data = data
end

function save:write_data()
  local data_json = json.encode(self.data)
  love.filesystem.write(self.file_path,data_json)
end

function save:get_saved_high(category,difficulty)
  if not self.data_read then
    self:read_data()
    self.data_read = true
  end
  cstr = tostring(category)
  dstr = tostring(difficulty)
  local high
  if self.data then
    local cdata = self.data[cstr]
    if cdata then
      high = cdata[dstr]
    end
  end
  return high
end

function save:write_high(category,difficulty,high)
  if not self.data_read then
    self:read_data()
    self.data_read = true
  end
  cstr = tostring(category)
  dstr = tostring(difficulty)
  if not self.data[cstr] then
    self.data[cstr] = {}
  end
  self.data[cstr][dstr] = high
  save:write_data()
end

return save