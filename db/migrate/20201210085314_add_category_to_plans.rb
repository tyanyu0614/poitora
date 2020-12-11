class AddCategoryToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :category, :integer
  end
end
