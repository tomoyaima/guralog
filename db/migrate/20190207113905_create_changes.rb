class CreateChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :changes do |t|

      t.string :change
    end
  end
end
