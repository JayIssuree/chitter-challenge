require 'database_connection'

describe DatabaseConnection do

    let(:subject) { DatabaseConnection }
    
    describe ".setup" do

        it "connects to the correct database" do
            expect(PG).to receive(:connect).with(dbname: "chitter_test")
            subject.setup(dbname: "chitter_test")
        end

        it "has a consistent connection to the database" do
            connection = subject.setup(dbname: "chitter_test")
            expect(subject.connection).to eq(connection)
        end

    end

    describe ".query" do
        
        it "executes a query via PG" do
            connection = subject.setup(dbname: "chitter_test")
            expect(connection).to receive(:exec).with("SELECT * FROM peeps")
            subject.query("SELECT * FROM peeps")
        end

    end

end