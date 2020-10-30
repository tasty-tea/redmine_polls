# frozen_string_literal: true

class Poll < ActiveRecord::Base
  def vote(answer)
    answers = {"yes" => :yes, "no" => :no, "unsure" => :unsure}
    increment(answers[answer].nil? ? :unsure : answers[answer])
  end
end
