class CreateSearchinfos < ActiveRecord::Migration[5.2]
  def change
    create_table :searchinfos do |t|
       t.string:school
       t.string:prefecture
       t.string:department
       t.string:major
    end
  end
end
