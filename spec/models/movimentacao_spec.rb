require 'rails_helper'

RSpec.describe Movimentacao, type: :model do
  it do
    movimentacao = build :movimentacao
    expect(movimentacao.valid?).to be_truthy
  end
end