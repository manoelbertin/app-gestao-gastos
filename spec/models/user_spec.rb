require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    user = User.new email: "nome@invenio.com"

    expect(user.email).to eq('nome@invenio.com')
  end
end
