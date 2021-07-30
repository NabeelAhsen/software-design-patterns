## Running tests

Run the following:

```sh
rb behavioural/strategy_pattern/context_test.rb
```

## Some thoughts

According to [Refactoring Guru](https://refactoring.guru/design-patterns/strategy/ruby/example#lang-features), the Strategy Pattern appears to be very popular. I have definitely seen it around in the codebase that I work in daily. However, I have never gotten around to wrapping my head around the structure of the Strategy pattern.

### My use case

_From the [Wikipedia Article](https://en.wikipedia.org/wiki/Strategy_pattern):_

>For instance, a class that performs validation on incoming data may use the strategy pattern to select a validation algorithm depending on the type of data, the source of the data, user choice, or other discriminating factors. These factors are not known until run-time and may require radically different validation to be performed. The validation algorithms (strategies), encapsulated separately from the validating object, may be used by other validating objects in different areas of the system (or even different systems) without code duplication.

I'm exploring this pattern for the following refactor I'd like to do to a Rails controller:

- The controller has two actions.
- Each action needs to run some business validations, but they are different for each action.

The reason why the Strategy Pattern appears to be a good fit to the use case above is because other business processes outside of the controller need to also be able to run the same validations in a different context. 

Creating concrete strategies representing different validations is a good way to reuse this across the controller and the different business processes.

I will update these findings if this turns out to be a bad idea for reason XYZ.

```rb
class ContextController < ApplicationController
  def action_a
    # ... business logic
    perform_checks(strategy: ConcreteStrategyA.new(), data: @data)
    # ... business logic
  end

  def action_b
    # ... business logic
    perform_checks(strategy: ConcreteStrategyB.new(), data: @data)
    # ... business logic
  end

  private

  def perform_checks(strategy:, data:)
   strategy.perform(data)
  end
end

class ContextBusinessProcess < BusinessProcess
  def perform(data)
    # ... business logic
    ConcreteStrategyB.perform(data)
    # ... business logic
  end
end

class Strategy
  # @abstract
end

class ConcreteStrategyA < Strategy
  # ...
end

class ConcreteStrategyB < Strategy
  # ...
end
```
