#!/usr/bin/env ruby
require 'json'

raw = File.read('./raw.json')
data = JSON.parse(raw)
out = {
  "priest" => [],
  "warlock" => [],
  "paladin" => [],
  "druid" => [],
  "hunter" => [],
  "rogue" => [],
  "mage" => [],
  "warrior" => [],
  "shaman" => [],
  "neutral" => []
}

for c in data['cards']
  if c['collectible'] == true and c['type'] != 'hero'
    new_c =  { :id => c['id'], :name => c['name'], :image => c['image'], :quality => c['quality'], :mana => c['mana'] }
    out[c['class']].push new_c
  end
end

puts out.to_json