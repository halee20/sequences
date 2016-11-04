class GuessesController < ApplicationController
  def index

    @first = params["first_number"].to_i
    @second = params["second_number"].to_i
    @third = params["third_number"].to_i

    if params["first_number"].present? && params["second_number"].present? && params["third_number"].present?
      g = Guess.new
      g.first_num = @first
      g.second_num = @second
      g.third_num = @third
      g.save
    end

    @list =Guess.all

    render("guesses/index.html.erb")
  end

  def answer
    # params = {"rule"=> "Hi there"}

    @user_answer = params["rule"]
    render("guesses/answer.html.erb")
  end
end
