Given("I am on the sign up page") do
  bbc_sign_up_page.visit_sign_up_page
end

When("I click that I am under thirteen") do
  bbc_sign_up_page.click_under_thirteen
end

Then("I should be on the parent email page") do
  expect(bbc_sign_up_page.current_url).to include "https://account.bbc.com/register/details/guardian?"
end

When("I click that I am over thirteen") do
  bbc_sign_up_page.click_over_thirteen
end

When("I input an age under thirteen") do
  bbc_sign_up_page.input_DOB 10, 10, 2010
end

Then("I should get a date of birth error") do
  expect(bbc_sign_up_page.find_error_box_ids).to include "form-message-dateOfBirth"
end

When("I input an invalid age") do
  bbc_sign_up_page.input_DOB 10, 20, 1970
end

When("I input a valid age") do
  bbc_sign_up_page.input_DOB 10, 10, 1970
end

Then("I should see a username field") do
  expect(bbc_sign_up_page.find_username?).to be true
end

Given("I have navigated to the registration form") do
  bbc_sign_up_page.visit_sign_up_page
  bbc_sign_up_page.click_over_thirteen
  bbc_sign_up_page.input_DOB 10, 10, 1970
end

When("I click submit form") do
  bbc_sign_up_page.click_register
end

Then("I should get five errors") do
  expect(bbc_sign_up_page.find_error_box_ids.length).to eq 5
end

Given("I input a taken email") do
  bbc_sign_up_page.input_username "com@com.com"
end

Given("I input a valid password") do
  bbc_sign_up_page.input_password "1qaz2wsx3edc"
end

Given("I input a valid postcode") do
  bbc_sign_up_page.input_postcode "SW1A2AA"
end

Given("I select a gender") do
  bbc_sign_up_page.select_gender "prefer not to say"
end

Given("I click opt out") do
  bbc_sign_up_page.click_opt_out
end

Then("I should get an email error") do
  expect(bbc_sign_up_page.find_error_box_ids).to include "form-message-email"
end

Given("I input an invalid email") do
  bbc_sign_up_page.input_username "waaaaaaaaaaaaaaluigi"
end

Given("I input a valid email") do
  bbc_sign_up_page.input_username "themetalvegetariangiantrodent@bbc.com"
end

Given("I input a short password") do
  bbc_sign_up_page.input_password "1q2!s"
end

Given("I input a simple password") do
  bbc_sign_up_page.input_password "ooooooooooooo"
end

Then("I should get a password error") do
  expect(bbc_sign_up_page.find_error_box_ids).to include "form-message-password"
end

When("I click Register Now") do
  bbc_sign_in_page.click_register_now
end

Given("I am on the homepage") do
  bbc_homepage.visit_homepage
end

When("I click the sign in link") do
  bbc_homepage.click_sign_in_link
end

Then("I should be on the sign up page") do
  expect(current_url).to include "account.bbc.com/register?"
end
