class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :title
      t.text :body
      t.integer :score
      t.text :book
      t.string :name
      t.string :department
      t.string :major
      t.text :job
      t.string :school
      t.timestamps
    end
  end
end
