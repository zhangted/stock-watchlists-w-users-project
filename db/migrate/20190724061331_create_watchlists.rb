class CreateWatchlists < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlists do |t|
      t.string :name
      t.string :tickers
      t.integer :user_id

      t.timestamps
    end
    add_index :watchlists, :name, unique: true
  end
end
