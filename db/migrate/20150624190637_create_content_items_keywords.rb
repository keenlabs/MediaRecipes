class CreateContentItemsKeywords < ActiveRecord::Migration
  def change
    create_table :content_items_keywords, id: false do |t|
      t.belongs_to :content_item
      t.belongs_to :keyword
    end
  end
end
