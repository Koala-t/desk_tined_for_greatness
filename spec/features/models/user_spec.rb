require 'spec_helper'

describe User do
  describe 'User' do
    before(:each) do
      @user = User.create(name: "tom", teacher: 5, is_teacher: false)
      @teacher = User.find(5)
      @before_results = @user.results.all 
    end

    it 'has a name' do
      expect(@user.name).to eq "tom"
    end

    it 'is not a teacher' do
      expect(@user.is_teacher).to eq false
    end

    it "has the right teacher" do
      expect(@user.teacher).to eq @teacher.id
    end

    it 'starts with no results' do
      expect(@before_results.length).to eq 0
    end

    it 'has results after answering a question' do
      Result.create(first_number: 1, 
        second_number: 1, 
        correct: true, 
        question_type: "addition", 
        student: @user.id)
      expect(@user.results.length).to eq 1
    end
  end
end