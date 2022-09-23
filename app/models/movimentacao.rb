class Movimentacao < ApplicationRecord
  enum :tipo, { saida: 'saida', entrada: 'entrada'}

  entradas = Movimentacao.entrada.sum(:valor)
    saidas = Movimentacao.saida.sum(:valor)

end
