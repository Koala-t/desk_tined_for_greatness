helpers do
  def number(max)
    if max.to_i < 1
      rand(10)
    else
      rand(max.to_i+1)
    end
  end

  def generateQuestion(type, max)
    question = {
      multiplication: '*',
      division: '/',
      addition: '+',
      subtraction: '-'
    }

    "#{number(max)} #{question[type.to_sym]} #{number(max)}"
  end
end

