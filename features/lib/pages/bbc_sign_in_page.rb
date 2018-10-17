require "capybara"

class BBCSignInPage
  SIGN_IN_URL = "https://account.bbc.com/signin"
  USERNAME_ID = "user-identifier-input"
  PASSWORD_ID = "password-input"
  SUBMIT_ID   = "#submit-button"
  ERROR_CLASS = ".form-message--error"
  REGISTER_LINK = ".link--primary"
  REGISTER_TEXT = "Register now"

  include Capybara::DSL

  def visit_sign_in_page
    visit(SIGN_IN_URL)
  end

  def click_register_now
    find(REGISTER_LINK).click
  end

  def input_username username
    fill_in(USERNAME_ID, with: username)
  end

  def input_password password
    fill_in(PASSWORD_ID, with: password)
  end

  def click_sign_in
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
