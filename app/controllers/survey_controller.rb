require 'typeform'

class SurveyController < ApplicationController

  def survey
  end

  def post_survey
  end

  def confirm
    if survey_completed?
      answers = find_answers
      current_user.surveys.last.update(:Q1 => answers[0], :Q2 => answers[1], :Q3 => answers[2], :Q4 => answers[3], :Q5 => answers[4], :Q6 => answers[5], :Q7 => answers[6], :Q8 => answers[7], :Q9 => answers[8], :Q10 => answers[9], :Q11 => answers[10], :Q12 => answers[11], :Q13 => answers[12], :Q14 => answers[13], :Q15 => answers[14], :Q16 => answers[15], :Q17 => answers[16], :Q18 => answers[17], :Q19 => answers[18], :Q20 => answers[19], :Q21 => answers[20], :Q22 => answers[21], :Q23 => answers[22], :completed => true)
      current_user.add(20)
    else
      redirect_to home_path
    end
  end

  def api_call
    Typeform.api_key = ENV["STEMAPI"]
    typeform_id = "TUqdcR"
    form = Typeform::Form.new(typeform_id)
    # Fetches all complete entries since one hour ago
    newest_entries = form.complete_entries(since: (Time.now - 300).to_i)
    return newest_entries
  end

  def find_answers

    api_call.responses.each do |response|
      if response.answers.email_6501923 == current_user.email
        q1 = response.answers.list_6361881_choice
        q2 = response.answers.list_6361801_choice
        q3 = response.answers.textfield_6361574
        q4 = response.answers.textfield_6361573
        q5 = response.answers.rating_6361576
        q6 = response.answers.rating_6361577
        q7 = response.answers.rating_6361578
        q8 = response.answers.rating_6361579
        q9 = response.answers.rating_6361580
        q10 = response.answers.rating_6361581
        q11 = response.answers.rating_6361582
        q12 = response.answers.rating_6361583
        q13 = response.answers.rating_6361584
        q14 = response.answers.rating_6361585
        q15 = response.answers.rating_6361586
        q16 = response.answers.rating_6361587
        q17 = response.answers.rating_6361588
        q18 = response.answers.rating_6361589
        q19 = response.answers.rating_6361590
        q20 = response.answers.rating_6361591
        q21 = response.answers.textfield_6361575
        q22 = response.answers.rating_6362752
        q23 = response.answers.yesno_6501929
        return [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23]
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