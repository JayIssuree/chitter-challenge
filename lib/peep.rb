class Peep

    def self.create(text:)
        result = DatabaseConnection.query("INSERT INTO peeps (content) VALUES ('#{text}') RETURNING id, content")
        Peep.new(
            id: result[0]['id'],
            content: result[0]['content']
        )
    end

    def self.all
        result = DatabaseConnection.query("SELECT * FROM peeps")
        result.map do |peep|
            Peep.new(
                id: peep['id'],
                content: peep['content']
            )
        end
    end


    attr_reader :id, :content

    def initialize(id:, content:)
        @id = id
        @content = content
    end

end