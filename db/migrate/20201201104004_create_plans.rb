class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table  :plans do |t|
      t.string     :title,           null: false
      t.text       :content,         null: false
      # t.integer    :category_id,     null: false
      t.integer    :cost,            null: false
      t.references :user,            null: false,foreign_key: true
      t.timestamps
    end
  end
end
