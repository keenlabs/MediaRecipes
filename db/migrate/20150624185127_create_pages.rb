class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.string :type
      
      t.belongs_to :topic

      t.timestamps
    end
  end
end
