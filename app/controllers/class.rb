get '/class/index' do
  if request.xhr?
    if currentUser.is_teacher
      erb :'teachers/class', layout: false
    else
      erb :'students/class', layout: false
    end
  else
    if currentUser.is_teacher
      erb :'teachers/class'
    else
      erb :'students/class'
    end
  end
end

get'/class/history/:type/chart' do
  @type = params[:type]
  results = Result.all.where(question_type: @type)
  incorrectNums = find_incorrect_nums(results)

  if session[:chart]
    session[:chart] += 1
  else
    session[:chart] = 1
  end

  incorrectNumbers = []
  incorrectTimes = []
  incorrectNums.each do |num, times|
    incorrectNumbers << num
    incorrectTimes << times
  end

  @numbers = incorrectNumbers
  @times = incorrectTimes

# add an array of the number and times correct/incorrect
# send that array to labels and data on partials/_chart
  if request.xhr?
    erb :'partials/_chart', layout: false
  else
    erb :'partials/_chart'
  end
end

get "/class/history/numbers" do
  if request.xhr?
    erb :'partials/_table', layout: false
  else
    erb :'partials/_table'
  end
end