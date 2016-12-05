class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :title
      t.string :detail
      t.datetime :endon
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
