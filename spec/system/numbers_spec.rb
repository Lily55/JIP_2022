# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Static content', type: :system do
  let(:num_value) { Faker::Number.number(digits: 4) }
  scenario 'Enter num' do
    visit root_path
    fill_in :n, with: num_value
    find('#result-btn').click
    expect(find('#flexible')).to match(/Вы ввели число: #{num_value}/)
  end
end
