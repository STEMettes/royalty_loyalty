require 'typeform'

class PostSurveyController < ApplicationController

  def post_confirm
    current_user.add(40)
    current_user.surveys.last.update(:Q1 => find_answer1, :Q2 => find_answer2, :Q3 => find_answer3, :Q4 => find_answer4, :Q5 => find_answer5)
  end




   def api_call
    Typeform.api_key = '88fa7f827f874aa8512352011772a7b0fbc2eeac'
    typeform_id = "tZg9UT"
    form = Typeform::Form.new(typeform_id)

    all_entries = form.all_entries
    incomplete_entries = form.incomplete_entries
    complete_entries = form.complete_entries

    # Fetches all complete entries since today
    newest_entries = form.complete_entries(since: Date.today.to_time.to_i)
    return newest_entries
  end

  def find_answer1
    api_call.responses.each do |response|
      if response.answers.email_6133380 == current_user.email
        return response.answers.rating_6099734
      end
    end
  end

  def find_answer2
    api_call.responses.each do |response|
      if response.answers.email_6133380 == current_user.email
        return response.answers.rating_6099735
      end
    end
  end

  def find_answer3
    api_call.responses.each do |response|
      if response.answers.email_6133380 == current_user.email
        return response.answers.rating_6099736
      end
    end
  end

  def find_answer4
    api_call.responses.each do |response|
      if response.answers.email_6133380 == current_user.email
        return response.answers.rating_6099737
      end
    end
  end

  def find_answer5
    api_call.responses.each do |response|
      if response.answers.email_6133380 == current_user.email
        return response.answers.textfield_6099738
      end
    end
  end


end
