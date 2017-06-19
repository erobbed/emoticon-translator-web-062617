# require modules here
require 'yaml'
require "pry"
#binding.pry

def load_library(path)
  file = YAML.load_file('./lib/emoticons.yml')
  #japanese_emoticons
  hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  file.each do |key, emoticon_array|
    hash['get_meaning'][emoticon_array[1]] = key
  end

  file.each do |key, emoticon_array|
    hash['get_emoticon'][emoticon_array[0]] = emoticon_array[1]
  end
  hash
  #binding.pry
end

def get_japanese_emoticon(path, emoticon)
  lib_hash = load_library(path)
  if lib_hash['get_emoticon'].keys.include?(emoticon)
      lib_hash['get_emoticon'][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  if load_library(path)['get_emoticon'].values.include?(emoticon)
    load_library(path)['get_meaning'][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
