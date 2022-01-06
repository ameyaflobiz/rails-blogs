class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :link
      t.belongs_to :imageable, polymorphic:true
      t.timestamps
    end
  end
end
