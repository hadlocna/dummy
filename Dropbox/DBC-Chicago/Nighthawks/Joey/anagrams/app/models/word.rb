class Word < ActiveRecord::Base
  # Remember to create a migration!
  def anagramed
    self.word.split("").sort.join
  end  

end
