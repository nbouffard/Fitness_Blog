require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  it 'should be ok' do
    get '/'
    expect(response).to be_successful
  end
end
