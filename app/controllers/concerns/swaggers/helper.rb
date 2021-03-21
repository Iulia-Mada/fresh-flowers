module Swaggers
  module Helper
    def self.id_parameter(description)
      { name: :id, in: :path, type: :uuid, required: true, description: description }
    end

    def self.color_name
      { name: :color_name, in: :query, type: :string, description: 'Filter by color name' }
    end

    def self.zodiac_sign
      { name: :zodiac_sign, in: :query, type: :string, description: 'Filter by zodiac sign' }
    end

    def self.page_parameter
      { name: :page, in: :query, type: :integer, description: 'Pagination parameter' }
    end

    def self.error_404_msg(model)
      { errors: "Couldn't find #{model} with 'id'= id" }
    end
  end
end
