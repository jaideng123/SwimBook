json.array!(@entries) do |entry|
  json.extract! entry, :id, :fname, :lname, :age, :parent, :pink, :yellow, :guard, :tested
  json.url idea_url(entry, format: :json)
end
