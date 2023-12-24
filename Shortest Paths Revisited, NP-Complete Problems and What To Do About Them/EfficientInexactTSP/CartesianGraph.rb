require_relative "./BaseGraph"

class CartesianGraph < BaseGraph

    def initialize
        @vertices = {}
    end

  def getEdgeValue(firstVertex, secondVertex)
    @edges["#{firstVertex}:#{secondVertex}"]
  end
end