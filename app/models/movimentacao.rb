class Movimentacao < ApplicationRecord
  enum :tipo, { saida: 'saida', entrada: 'entrada'}

  validates :data, presence: true
  validates :descricao, presence: true
  validates :valor, presence: true
  validates :tipo, presence: true
  validates :data, comparison: { greater_than: :end_date}
  
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
