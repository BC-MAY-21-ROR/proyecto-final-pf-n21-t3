class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
