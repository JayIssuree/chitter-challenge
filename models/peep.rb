class Peep < ActiveRecord::Base

    def format_time_date
        (self.created_at + 3600).strftime("%A %d %B at %k:%M")
    end

end