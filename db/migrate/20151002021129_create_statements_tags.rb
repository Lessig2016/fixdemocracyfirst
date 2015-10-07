class CreateStatementsTags < ActiveRecord::Migration
  def change
    create_table :statements_tags do |t|
      t.integer :tag_id, :statement_id, null: false
    end
  end
end
