get '/users/:id' do
  @user = currentUser
  if @user.is_teacher
    erb :'teachers/show'
  else
    erb :'students/show'
  end
end

get '/users/:id/history' do
  @user = User.find(params[:id])
  if request.xhr?
    erb :'students/history', layout: false
  else
    erb :'students/history'
  end
end

get'/users/:id/history/:type' do
  @user = User.find(params[:id])
  @type = params[:type]

  if request.xhr?
    erb :'partials/_additionTable', layout: false
  else
    erb :'partials/_additionTable'
  end
end

get'/users/:id/history/:type/:correct/chart' do
  @user = User.find(params[:id])
  @type = params[:type]
  results = @user.results.where(question_type: @type)
  correctNums = find_correct_nums(results)
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

  correctNumbers = []
  correctTimes = []
  correctNums.each do |num, times|
    correctNumbers << num
    correctTimes << times
  end

  if params[:correct] == 'correct'
    @numbers = correctNumbers
    @times = correctTimes
  else
    @numbers = incorrectNumbers
    @times = incorrectTimes
  end
# add an array of the number and times correct/incorrect
# send that array to labels and data on partials/_chart
  if request.xhr?
    erb :'partials/_chart', layout: false
  else
    erb :'partials/_chart'
  end
end

get '/users/:id/classHistory' do
  @class = currentUser.students
  if request.xhr?
    erb :'teachers/classHistory', layout: false
  else
    erb :'teachers/classHistory'
  end
end