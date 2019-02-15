class CreateQuestions < ActiveRecord::Migration[5.2]
  # This file was created when we generated the question model
  # To generate a model do:
  # rails g model <model-name> <...colum_name:type...>

  # To run all your remaining migrations do:
  # rails db:migrate

  # To look at the status of migrations (whether
  # they're active or not)
  # rails db:migrate:status

  def change
    create_table :questions do |t|
      # Automatically generates an "id" column that
      # auto increments and acts as our primary key
      t.string :title # This creates a VARCHAR(255) column named "title"
      t.text :body # This creates a TEXT column named "body"
      # This will create two colums "created_at"
      # and updated_at. The fields are automatically
      # set by ActiveRecord.
      t.timestamps
    end
  end
end
