class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.string :numero1
      t.string :operador
      t.string :numero2
      t.string :resultado

      t.timestamps
    end
  end
end
