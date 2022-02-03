class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :phone_num
      t.string :city
      t.string :state
      t.string :country
      t.text :description
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
