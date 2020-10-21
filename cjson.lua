ledtable = {}
tmp=99

ledtable.M="update"
ledtable.ID="15378"
ledtable.V=[[{\"14016\":]]..tmp..[["}]]

ok, json = pcall(cjson.encode, ledtable)
if ok then
  print(json)
else
  print("failed to encode!")
end

t = cjson.decode(json)
print(t.V)