text=File.open('words').read

text.each_line do |t|
   Word.create(word: t.chomp)
end  
