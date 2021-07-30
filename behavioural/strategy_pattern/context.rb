# The Context defines the interface of interest to clients
class Context
  # The context holds an instance of a strategy, but it should not
  # know about a specific concrete strategy.
  def initialize(data:, strategy:)
    @data = data
    @strategy = strategy
  end

  def do_some_business_logic
    # Some business processing here ...

    @strategy.perform(@data)

    # Some business processing here ...
  end
end

class Strategy
  # @abstract
  #
  # @param [Array] data
  def perform(data)
    raise NotImplementedError
  end
end

class ConcreteStrategy < Strategy # Concrete strategy does the work
  # @override
  def perform(data); end
end

class SumData < Strategy # Does not accept strings
  # @override
  def perform(data)
    raise ArgumentError unless data.all? { |value| value.is_a?(Integer) }

    data.inject(0) { |sum, value| sum + value }
  end
end

class ConcatenateData < Strategy # This also adds ints, but accepts strings
  # @override
  def perform(data)
    data.inject(:+)
  end
end