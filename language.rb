# Class presents json element

require './searching_methods.rb'

class Language
  include SearchingMethods

  attr_accessor :name, :types, :designed_by

  def initialize(name, types, designed_by)
    @name = name
    @types = types
    @designed_by = designed_by
  end

  def include_word?(word)
    include_name?(word) || include_type?(word) || include_designer?(word)
  end

  def to_s
    "Name: #{name}, \nType: #{types}, \nDesigned by: #{designed_by}"
  end

  private

  def include_name?(name_word)
    sentence_equal_words_maches?(name, name_word)
  end

  def include_type?(type)
    answer = false
    types.split(',').map(&:strip).each do |tp|
      answer ||= sentence_include_words?(tp, type)
    end
    answer
  end

  def include_designer?(designed_by_name)
    answer = false
    designed_by.split(',').map(&:strip).each do |d_b|
      answer ||= sentence_include_words?(d_b, designed_by_name)
    end
    answer
  end
end
