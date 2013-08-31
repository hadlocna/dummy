# Solution for Challenge: Pig-latin. Started 2013-08-27T15:18:52+00:00

def convert_word_to_pig_latin(word)
  #word = gets.chomp
  vowels = %w{a e i o u A E I O U}
  if vowels.include?(word[0])
    return word
  else
    initial_consonants = ''
    word.each_char do |ch| 
      if !vowels.include?(ch)
        initial_consonants << ch
        word = word.slice(1,word.length)
      else
        break
      end
    end
    word + initial_consonants + "ay"
  end

end

def convert_complete_sentence
  sentence = gets.chomp
  english_array = sentence.split
  converted_array = []
  num_converted = 0
  english_array.each do |word|
    converted_word = convert_word_to_pig_latin(word)
    converted_array << converted_word
    num_converted += 1 if (converted_word != word)
  end
  converted_array.join(" ")
end

p convert_complete_sentence

