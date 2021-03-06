module SearchingMethods
  def sentence_include_words?(sentenсe, words)
    return false if words.empty? || sentenсe.empty?
    sentenсe_to_words_arr = sentenсe.split(' ')
    words.split(' ').each do |word|
      return false unless sentenсe_to_words_arr.include?(word)
    end
    true
  end

  def sentence_equal_words_maches?(sentenсe, words)
    return false if words.empty? || sentenсe.empty?
    words.split(' ').sort == sentenсe.split(' ').sort
  end

  
end

class Some
	include SearchingMethods
	def check
		sentence_include_words?("Thomas Eugene Kurtz", "Eugene Thomas")
	end
end
a=Some.new
puts a.check
