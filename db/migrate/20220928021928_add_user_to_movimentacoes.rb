class AddUserToMovimentacoes < ActiveRecord::Migration[7.0]
  def change
    add_reference :movimentacoes, :user, null: true, foreign_key: true
  end
end
