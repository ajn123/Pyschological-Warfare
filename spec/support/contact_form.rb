# frozen_string_literal: true

class ContactForm
  include Capybara::DSL

  def visit_page
    visit('/')
    find('#contactMe').click
    self
  end

  def submit
    click_on('Yes')
    self
  end

  def fill_in_with(params = {})
    fill_in('Your Name...', with: params.fetch(:name, 'John'))
    fill_in('Your Email...', with: params.fetch(:email, 'ajn123@vt.edu'))
    self
  end
end
