class Movimentacao < ApplicationRecord
  enum :tipo, { saida: 'saida', entrada: 'entrada'}

  belongs_to :user

  validates :descricao, presence: true
  validates :descricao, length: {minimum:3, maximum:150}
  validates :valor, presence: true
  validates :tipo, presence: true
  validates :data, comparison: { less_than_or_equal_to: proc { Date.current } }

  validate :valida_se_existe_saldo

  def self.saldo_atual
    self.entrada.sum(:valor) - self.saida.sum(:valor)
  end


  private

  def valida_se_existe_saldo
    return unless user
    return if entrada?
    return if valor.to_f <= user.movimentacoes.saldo_atual 
    errors.add valor.to_s, 'reais NÃO PODE! Porque não há saldo suficiente para debitar.'
  end
end
