class CreateCategoriesDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_doctors do |t|
      t.belongs_to :doctor
      t.belongs_to :category
      t.timestamps
    end
  end
end
