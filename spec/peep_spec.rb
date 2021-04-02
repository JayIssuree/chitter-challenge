require 'peep'
require 'database_helpers'

describe Peep do
    
    describe ".create" do
        
        it "saves a peep to the database and returns a peep object" do
            peep = Peep.create(text: "this is an example peep")
            persisted_data = persisted_data(table: 'peeps', id: peep.id)
            expect(peep.id).to eq(persisted_data['id'])
            expect(peep.content).to eq("this is an example peep")
            expect(peep).to be_a(Peep)
        end

    end

    describe ".all" do
        
        it "returns an array of all the peeps" do

            peep = Peep.create(text: "this is an example peep1")
            Peep.create(text: "this is an example peep2")
            Peep.create(text: "this is an example peep3")
            peeps = Peep.all

            expect(peeps.length).to eq(3)
            expect(peeps.first.id).to eq(peep.id)
            expect(peeps.first.content).to eq("this is an example peep1")
        end

    end

    describe "#initialize" do
        
        it "is initialized with an id and content" do
            peep = Peep.new(id: 1, content: "this is the content")
            expect(peep.id).to eq(1)
            expect(peep.content).to eq("this is the content")
        end

    end

end