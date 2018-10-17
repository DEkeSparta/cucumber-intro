require "capybara"

class BBCSignUpPage
  include Capybara::DSL

  SIGN_UP_URL = "https://account.bbc.com/register"

  USERNAME_ID = "user-identifier-input"
  PASSWORD_ID = "password-input"
  POSTCODE_ID = "postcode-input"
  GENDER_ID = "#gender-input"
  NO_BUTTON_ID = "label[for=\"optOut\"]"
  SUBMIT_ID   = "#submit-button"

  ERROR_CLASS = ".form-message--error"

  DAY_FIELD_ID = "day-input"
  MONTH_FIELD_ID = "month-input"
  YEAR_FIELD_ID = "year-input"

  DOB_SUBMIT_ID = "#submit-button"

  def visit_sign_up_page
    visit(SIGN_UP_URL)
  end

  def click_under_thirteen
    find('a[aria-label="Under 13"]').click
  end

  def click_over_thirteen
    find('a[aria-label="13 or over"]').click
  end

  def input_DOB day, month, year
    fill_in DAY_FIELD_ID, with: day
    fill_in MONTH_FIELD_ID, with: month
    fill_in YEAR_FIELD_ID, with: year
    find(DOB_SUBMIT_ID).click
  end

  def find_username?
    if find("#"+USERNAME_ID)
      return true
    end
    return false
  end

  def input_username username
    fill_in(USERNAME_ID, with: username)
  end

  def input_password password
    fill_in(PASSWORD_ID, with: password)
  end

  def input_postcode postcode
    fill_in(POSTCODE_ID, with: postcode)
  end

  def select_gender gender
    find(GENDER_ID).find("option[value=\"#{gender}\"]").select_option
  end

  def click_opt_out
    find(NO_BUTTON_ID).click
  end

  def click_register
    find(SUBMIT_ID).click
  end

  def find_error_box_ids
    if has_css?(ERROR_CLASS)
      error_box = all(ERROR_CLASS)
      return error_box.map {|err| err[:id]}
    else
      return nil
    end
  end

end
