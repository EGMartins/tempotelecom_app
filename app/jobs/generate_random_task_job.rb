# frozen_string_literal: true

# Description: This job will generate a random task and save it to the database
class GenerateRandomTaskJob < ActiveJob::Base
  queue_as :default

  def perform(*_args)
    task = Task.new(name: Faker::Lorem.word, description: Faker::Lorem.sentence, complete: false)
    task.save!
    sleep(10)
  end
end
