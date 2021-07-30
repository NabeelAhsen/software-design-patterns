require "test/unit"
require_relative "context"

class ContextTest < Test::Unit::TestCase
  def test_perform_business_logic_with_default_strategy_raises
    assert_raises NotImplementedError do
      context = Context.new(data: [], strategy: Strategy.new())
      context.do_some_business_logic
    end
  end

  def test_perform_business_logic_with_concrete_strategy_runs
      context = Context.new(data: [], strategy: ConcreteStrategy.new())
      assert_nil context.do_some_business_logic
  end
end

class SumDataTest < Test::Unit::TestCase
  def test_strategy_raises_argument_error_if_data_is_not_all_int
    assert_raises ArgumentError do
      context = Context.new(data: ["a"], strategy: SumData.new())
      context.do_some_business_logic
    end
  end

  def test_strategy_returns_zero_for_empty_data
    context = Context.new(data: [], strategy: SumData.new())
    assert_equal 0, context.do_some_business_logic
  end

  def test_strategy_returns_sum_of_data
    context = Context.new(data: [1, 2, 3], strategy: SumData.new())
    assert_equal 6, context.do_some_business_logic
  end
end

class ConcatenateDataTest < Test::Unit::TestCase
  def test_strategy_raises_argument_error_if_data_is_not_all_concatenatable
    assert_raises TypeError do
      context = Context.new(data: [1, "a"], strategy: ConcatenateData.new() )
      context.do_some_business_logic
    end
  end

  def test_strategy_concatenates_strings_together
    context = Context.new(data: ["b", "a"], strategy: ConcatenateData.new() )
    result = context.do_some_business_logic

    assert_equal "ba", result
  end

  def test_strategy_adds_integers_together
    context = Context.new(data: [1, 1, 1], strategy: ConcatenateData.new() )
    result = context.do_some_business_logic

    assert_equal 3, result
  end
end