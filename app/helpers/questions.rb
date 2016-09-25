helpers do
  def number(max)
    if max.to_i < 1
      rand(10)
    else
      rand(max.to_i+1)
    end
  end

  def operator(type)
    question = {
      multiplication: '*',
      division: '/',
      addition: '+',
      subtraction: '-'
    }
    question[type.to_sym]
  end
end

