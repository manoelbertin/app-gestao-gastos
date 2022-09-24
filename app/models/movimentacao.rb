class Movimentacao < ApplicationRecord
  enum :tipo, { saida: 'saida', entrada: 'entrada'}

  validates :descricao, presence: true
  validates :valor, presence: true
  validates :tipo, presence: true
  validates :data, comparison: { less_than_or_equal_to: Date.current }
  
  validate :valida_se_existe_saldo

  def self.saldo_atual
    self.entrada.sum(:valor) - self.saida.sum(:valor)
  end


  private

  def valida_se_existe_saldo 
    return if entrada?
    return if valor.to_f <= Movimentacao.saldo_atual 
    errors.add :valor, 'não há saldo suficiente para debitar'
  end
end
