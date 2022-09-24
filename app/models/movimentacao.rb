class Movimentacao < ApplicationRecord
  enum :tipo, { saida: 'saida', entrada: 'entrada'}

  validate :valida_se_existe_saldo

  def self.saldo_atual
    self.entrada.sum(:valor) - self.saida.sum(:valor)
  end


  private

  def valida_se_existe_saldo 
    if valor > Movimentacao.saldo_atual 
      errors.add :valor, 'Não há saldo suficiente para debitar'
    end
  end
end
