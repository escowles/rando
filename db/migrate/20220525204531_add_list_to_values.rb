class AddListToValues < ActiveRecord::Migration[7.0]
  def change
    add_reference :values, :list, null: false, foreign_key: true
  end
end
