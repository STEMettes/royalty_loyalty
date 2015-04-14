require 'typeform'

class SurveyController < ApplicationController

  def survey

  end

  def post_survey
  end

  def confirm
    current_user.surveys.last.update(:Q1 => find_answer1, :Q2 => find_answer2, :Q3 => find_answer3, :Q4 => find_answer4, :Q5 => find_answer5)
  end

  def api_call
    Typeform.api_key = '88fa7f827f874aa8512352011772a7b0fbc2eeac'
    typeform_id = "hWbC8o"
    form = Typeform::Form.new(typeform_id)
    # Fetches all complete entries since one hour ago
    newest_entries = form.complete_entries(since: (Time.now - 60).to_i)
    return newest_entries
  end

  def find_answer1
    api_call.responses.each do |response|
      if response.answers.email_6109000 == current_user.email
        return response.answers.rating_6099488
      end
    end
  end

  def find_answer2
    api_call.responses.each do |response|
      if response.answers.email_6109000 == current_user.email
        return response.answers.rating_6099515
      end
    end
  end

  def find_answer3
    api_call.responses.each do |response|
      if response.answers.email_6109000 == current_user.email
        return response.answers.rating_6099600
      end
    end
  end

  def find_answer4
    api_call.responses.each do |response|
      if response.answers.email_6109000 == current_user.email
        return response.answers.rating_6099603
      end
    end
  end

  def find_answer5
    api_call.responses.each do |response|
      if response.answers.email_6109000 == current_user.email
        return response.answers.textfield_6099610
      end
    end
  end

end