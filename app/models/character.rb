require 'pry'
class Character < ActiveRecord::Base
  belongs_to :actors
  belongs_to :shows
  def actor
    found_actor = Actor.find(actor_id = self.actor_id)
  end

  def show
    found_show = Show.find(show_id = self.show_id)
  end

  def say_that_thing_you_say
    catchphrase = self.catchphrase
    "#{self.name} always says: #{catchphrase}"
  end
end