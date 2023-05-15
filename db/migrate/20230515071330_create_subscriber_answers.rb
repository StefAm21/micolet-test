class CreateSubscriberAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriber_answers do |t|
      t.references :subscriber, null: false, foreign_key: true
      t.string :description
      t.string :typeform_question_reference

      t.timestamps
    end
  end
end
