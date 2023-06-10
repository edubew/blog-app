class ChangeForeignKeyFromUserIdToAuthorIdInLike < ActiveRecord::Migration[7.0]
  def change
    if column_exists?(:likes, :author_id)
    rename_column :likes, :user_id, :author_id
    end

    if !column_exists?(:likes, :author_id)
      add_column :likes, :author_id, :integer
    end

    add_foreign_key :likes, :users, column: :author_id
  end
end
