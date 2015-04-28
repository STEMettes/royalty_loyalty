require 'typeform'

class PostSurveyController < ApplicationController

  def post_confirm
    if survey_completed?
      answers = find_answers
      current_user.surveys.last.update(:Q1 => answers[0], :Q2 => answers[1], :Q3 => answers[2], :Q4 => answers[3], :Q5 => answers[4], :Q6 => answers[5], :Q7 => answers[6], :Q8 => answers[7], :Q9 => answers[8], :Q10 => answers[9], :Q11 => answers[10], :Q12 => answers[11], :Q13 => answers[12], :Q14 => answers[13], :Q15 => answers[14], :Q16 => answers[15], :Q17 => answers[16], :Q18 => answers[17], :Q19 => answers[18], :Q20 => answers[19], :Q21 => answers[20], :Q22 => answers[21], :Q23 => answers[22], :Q24 => answers[23], :Q25 => answers[24], :Q26 => answers[25], :Q27 => answers[26], :completed => true)
      current_user.add(40)
    else
      redirect_to home_path
    end
  end

   def api_call
    Typeform.api_key = "3465083e397e6d5b006f8a25c77e3c730a71c8ee"
    typeform_id = "tUizPJ"
    form = Typeform::Form.new(typeform_id)
    # Fetches all complete entries since one hour ago
    newest_entries = form.complete_entries(since: (Time.now - 60).to_i)
    return newest_entries
  end

  def find_answers
    api_call.responses.each do |response|
      if response.answers.email_6501830 == current_user.email
        q1 = response.answers.textfield_6363147
        q2 = response.answers.textfield_6363145
        q3 = response.answers.textfield_6363146
        q4 = response.answers.list_6364591_choice
        q5 = response.answers.list_6364607_choice
        q6 = response.answers.yesno_6363167
        q7 = response.answers.yesno_6363169
        q8 = response.answers.rating_6363149
        q9 = response.answers.rating_6363150
        q10 = response.answers.rating_6363151
        q11 = response.answers.rating_6363152
        q12 = response.answers.rating_6363153
        q13 = response.answers.rating_6363154
        q14 = response.answers.rating_6363155
        q15 = response.answers.rating_6363156
        q16 = response.answers.rating_6363157
        q17 = response.answers.rating_6363158
        q18 = response.answers.rating_6363159
        q19 = response.answers.rating_6363160
        q20 = response.answers.rating_6363161
        q21 = response.answers.rating_6363162
        q22 = response.answers.rating_6363163
        q23 = response.answers.rating_6363164
        q24 = response.answers.rating_6363165
        q25 = response.answers.textfield_6363148
        q26 = response.answers.textarea_6363170
        q27 = response.answers.yesno_6501913
        return [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27]
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
