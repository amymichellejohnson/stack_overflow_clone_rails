class AddColumnToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :is_first, :boolean, default: false
  end
end
