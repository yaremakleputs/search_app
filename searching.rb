require './language.rb'
require 'json'

class SearchingEngine
  attr_accessor :languages

  def initialize
    @languages = []
  end

  def all_languages
    languages = JSON.parse(File.read('data.json'))
    languages.each do |lang|
      @languages << Language.new(lang['Name'], lang['Type'], lang['Designed by'])
    end
  end

  def search_by_attributes(words)
    words = words.scan(/(?:"")|(?:"(.*[^\\])")|(\S+)/).flatten.compact
    mached_languages = []
    @languages.each do |lang|
      mached_languages << lang if words_mashes?(lang, words)
    end
    mached_languages
  end

  def words_mashes?(language, words)
    answer = true	
    words.each do |word|
      if word[0] == '-'
        return false if language.include_word?(word[1..(word.length - 1)])
      else	
        answer &&= language.include_word?(word)
      end
    end
    answer
  end
end

puts "Hello!"
while true
  engine = SearchingEngine.new
  engine.all_languages
  puts "To search phrase match use double quotes \"\""
  puts "Please enter your request"
  request = gets.chomp
  languages = engine.search_by_attributes(request)
  puts "Not founded" unless languages.any?
  languages.each do |lang|
    puts lang
    puts '-'*20
  end
  puts "Do You want to repeat?(y/n)"
  repeat_answer = gets.chomp
  break if repeat_answer != "y"
end
puts "Good bye!"
