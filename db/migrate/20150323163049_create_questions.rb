class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.timestamps
    end

    create_table :answers do |t|
      t.string :body
      t.integer :question_id
      t.timestamps
    end
  end
end
