class AddBodyToBlog < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :body, :text
  end
end
