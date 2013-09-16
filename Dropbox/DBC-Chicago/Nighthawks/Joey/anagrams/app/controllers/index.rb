get '/' do
  # Look in app/views/index.erb
  erb :index
end

# post "/" do
#   p @word = params[:word]
#   p @results = []
#   Word.all.each do |x|
#     @results << x.word if x.anagramed == @word.split("").sort.join
#   end  
# p @results
#   erb :
# end  

get "/:word" do
  @word = params[:word]
  @results = []
  Word.all.each do |x|
    @results << x.word if x.anagramed == @word.split("").sort.join
  end
  erb :index
end  
