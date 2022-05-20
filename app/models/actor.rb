require 'pry'
class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def characters
        # binding.pry
        all_characters = Character.where("actor_id = ?", self.id)
    end

    def shows
        all_shows = Show.where("id = ?", self.id)
    end

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        self.characters.each do |character|
            show = self.shows.first
            return "#{character.name} - #{show.name}"
        end 
    end


end