require 'forwardable'
class Line_Data
    attr_accessor :data, :player
    def initialize(data, player)
      @data = data
      @player = player
    end
    include Enumerable
    extend Forwardable
    def_delegators :@result_array, :each, :<<
end
