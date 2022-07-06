class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        Freebie.find_by(item_name: item_name).dev_id == self.id
    end

    def give_away(dev: , freebie:)
        if self.received_one?(freebie.item_name) == true
            freebie.update(dev_id: dev.id)
        end
    end
end
