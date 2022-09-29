FactoryBot.define do
  factory :movimentacao do
    tipo { :entrada }
    valor { 1500.0 }
    descricao { 'Teste'}
    data { Date.current }
    user
  end
end