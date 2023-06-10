class ChangeForeignKeyFromUserIdToAuthorIdInComment < ActiveRecord::Migration[7.0]
  def change
    if column_exists?(:comments, :author_id)
    rename_column :comments, :user_id, :author_id
    end

    if !column_exists?(:comments, :author_id)
      add_column :comments, :author_id, :integer
    end

    add_foreign_key :comments, :users, column: :author_id
  end
end
