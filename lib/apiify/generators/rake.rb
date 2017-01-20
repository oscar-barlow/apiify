require 'thor/group'
module Apiify
  module Generators
    class Rake < Thor::Group
      include Thor::Actions

      argument :group, :type => :string
      argument :name, :type => :string

      def create_group
        empty_directory(group)
      end

      
    end
  end
end
