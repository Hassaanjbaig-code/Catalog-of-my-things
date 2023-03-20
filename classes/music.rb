require_relative 'item'

class Music < Item
    def initialize(genre, author, source, _label, publish_date, on_spotify)
        super(genre, author, source, _label, publish_date)
        @on_spotify= on_spotify
    end

    private

    def can_be_archived?
        super && @on_spotify
    end
end
