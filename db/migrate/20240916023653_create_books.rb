class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
          	#追加カラム
    	      t.string :title
            t.text :body
            t.integer :user_id

      t.timestamps
    end
  end
end
