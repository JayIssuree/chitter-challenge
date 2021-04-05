class CreatePeeps < ActiveRecord::Migration[6.1]
  def change
    create_table :peeps do |t|
      t.string :content
      t.datetime :created_at
    end
  end
end
