class CreateSocialNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :social_networks do |t|
      t.string :twitter
      t.string :Facebook
      t.string :LinkendIn
      t.string :Instagram
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
