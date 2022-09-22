class CreateMovimentacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :movimentacoes do |t|
      t.date :data
      t.string :descricao
      t.integer :valor
      t.string :tipo

      t.timestamps
    end
  end
end
