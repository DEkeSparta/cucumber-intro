Given("I access the bbc login page") do
  bbc_homepage.visit_homepage
  bbc_homepage.click_sign_in_link
end

Given("I input incorrect username details") do
  bbc_sign_in_page.input_username "not@valid.email"
end

Given("I input incorrect password details") do
  bbc_sign_in_page.input_password "2"
end

When("I submit my details") do
  bbc_sign_in_page.click_sign_in
end

Then("I receive and error for not finding the account") do
  expect(bbc_sign_in_page.find_error_box_ids).to include "form-message-password"
end
