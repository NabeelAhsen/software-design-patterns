## Running tests

Run the following:

```sh
ruby penguin_builder_test.rb
```

## Some thoughts

This specific builder pattern example is not an entirely useful one. This was created as a sort of deliberate practice to solidify my own understanding of the builder pattern.

> The intent of the Builder design pattern is to separate the construction of a complex object from its representation.

Ruby is an idiomatic language. In most scenarios like this, the clear (and simple) thing to do would be to use the keyword arguments that are built into Ruby.

```rb
penguin = Penguin.new(
  beak_colour: "orange",
  height: 2.3
)
```

Right now, I'm on the lookout for _real_, valid use cases of the builder pattern using Ruby. The intent behind this pattern is clear, but when does it make sense to employee this pattern, and when does it not? How does the choice of language fit into making this decision?