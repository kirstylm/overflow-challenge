class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
