require 'typeform'

class PostSurveyController < ApplicationController

  def post_confirm
    if survey_completed?
      answers = find_answers
      current_user.surveys.last.update(:Q1 => answers[0], :Q2 => answers[1], :Q3 => answers[2], :Q4 => answers[3], :Q5 => answers[4], :completed => true)
      current_user.add(40)
    else
      redirect_to home_path
    end
  end

   def api_call
    Typeform.api_key = ENV["STEMAPI"]
    typeform_id = "tUizPJ"
    form = Typeform::Form.new(typeform_id)
    # Fetches all complete entries since one hour ago
    newest_entries = form.complete_entries(since: (Time.now - 60).to_i)
    return newest_entries
  end

  def find_answers
    api_call.responses.each do |response|
      if response.answers.email_6133380 == current_user.email
        q1 = response.answers.rating_6099734
        q2 = response.answers.rating_6099735
        q3 = response.answers.rating_6099736
        q4 = response.answers.rating_6099737
        q5 = response.answers.textfield_6099738
        return [q1, q2, q3, q4, q5]
      end
    end
  end

  def survey_completed?
    if current_user.surveys != nil
      current_user.surveys.last.completed == false
    else
      false
    end
  end

end
