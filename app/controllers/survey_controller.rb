require 'typeform'

class SurveyController < ApplicationController

  def survey

  end

  def post_survey
  end

  def confirm
    answers = find_answers
    current_user.surveys.last.update(:Q1 => answers[0], :Q2 => answers[1], :Q3 => answers[2], :Q4 => answers[3], :Q5 => answers[4])
    current_user.add(20)
  end

  def api_call
    Typeform.api_key = '88fa7f827f874aa8512352011772a7b0fbc2eeac'
    typeform_id = "hWbC8o"
    form = Typeform::Form.new(typeform_id)
    # Fetches all complete entries since one hour ago
    newest_entries = form.complete_entries(since: (Time.now - 60).to_i)
    return newest_entries
  end

  def find_answers
    api_call.responses.each do |response|
      if response.answers.email_6109000 == current_user.email
        q1 = response.answers.rating_6099488
        q2 = response.answers.rating_6099515
        q3 = response.answers.rating_6099600
        q4 = response.answers.rating_6099603
        q5 = response.answers.textfield_6099610
        return [q1, q2, q3, q4, q5]
      end
    end
  end

end