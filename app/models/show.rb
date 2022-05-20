require 'pry'
class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :networks

    def characters
        Character.where("show_id = ?", self.id)
    end

    def network
        Network.where("id = ?", self.network_id)
    end

    def actors_list
        binding.pry
        all_characters = self.characters.all
        
        all_characters.map do |one_character|
            binding.pry
           charac_id = Character.where("show_id = ?", one_character.show_id).first
           actor = Actor.where("id = ?", charac_id.actor_id).first
           return "#{actor.first_name} #{actor.last_name}"
        end
    end

end