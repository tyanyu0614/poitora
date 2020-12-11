class RenameCategoryColumnToPlans < ActiveRecord::Migration[6.0]
  def change
    rename_column :plans, :category, :category_id
  end
end
