post '/results' do
  result = Result.new()

  result.first_number = session[:question]
  result.second_number = session[:question]
  p result
end