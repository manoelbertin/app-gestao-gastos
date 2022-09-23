class Movimentacao < ApplicationRecord
  enum :tipo, { saida: 'saida', entrada: 'entrada'}

  def self.saldo_atual
    self.entrada.sum(:valor) - self.saida.sum(:valor)
  end
end
