require './models/peep'

describe Peep do
    
    describe "#format_date_time" do
        
        it "neatly displays the date & time" do
            time = Time.new(2020, 8, 6, 14, 45, 00)
            peep = Peep.create(content: "time & date peep", created_at: time)
            expect(peep.format_time_date).to eq("Thursday 06 August at 14:45")
        end

    end

end