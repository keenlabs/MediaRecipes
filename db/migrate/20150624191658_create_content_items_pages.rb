class CreateContentItemsPages < ActiveRecord::Migration
  def change
    create_table :content_items_pages, id: false do |t|
      t.belongs_to :content_item
      t.belongs_to :page

      t.timestamps
    end
  end
end
