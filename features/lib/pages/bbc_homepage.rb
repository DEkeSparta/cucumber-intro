class BBCHomepage
  include Capybara::DSL

  HOMEPAGE_URL = "https://www.bbc.co.uk/"
  SIGN_IN_LINK_ID = "#idcta-link"

  def visit_homepage
    visit(HOMEPAGE_URL)
  end

  def get_sign_in_link
    find(SIGN_IN_LINK_ID)
  end

  def click_sign_in_link
    get_sign_in_link.click
  end

end
