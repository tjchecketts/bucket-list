class AddBucketToList < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :bucket, :string
  end
end
