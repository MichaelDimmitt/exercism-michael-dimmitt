1) capture operator can turn a function into an anonymous function in elixir, 
2) &1 is a value placeholder, and it identifies the nth argument of the function
  see:<br/>
    https://dockyard.com/blog/2016/08/05/understand-capture-operator-in-elixir<br/>
    operator is shown here in hex docs: https://hexdocs.pm/elixir/master/operators.html<br/>

some examples of map:
```elixir
iex> %{3 => "four", "one" => :two}["one"] 
:two

iex> %{a: 1, b: 2, c: 3}[:b]
2
```
question: "why is an atom needed to access the key in the above map?"
```elixir
iex> map = %{a: 1, 'b': 2, c: 3}[:b]
2

Map.put(map, d, 3)
```

single quote vs double quote usage is a very important distinction
```elixir 
    word = String.split(sentence, " ") # works
    # word = String.split(sentence, ' ') # fails
```
