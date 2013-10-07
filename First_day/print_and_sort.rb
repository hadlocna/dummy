def print_and_sort(array)
  output_string = ""
  array.map! {|x| x.nil? ? "" : x.to_s}
  array.each do |element|
    output_string = output_string + " " + element
  end
  puts output_string
  array.sort
end

words= %w{ all i can say is that my life is pretty plain } 
words_with_nil=words.dup.insert(3, nil)
mixed_array=["2", 1, "5", 4, "3"]
p words
p print_and_sort(words_with_nil)
p mixed_array
