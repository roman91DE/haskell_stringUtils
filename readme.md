# StringUtils

A simple Haskell module providing string manipulation functions inspired by Python's native `str` methods.

## Features

This library mimics common string methods from Python:

- `strip`: remove leading and trailing whitespace
- `contains`: check if a substring is present
- `replaceFirst`: replace the first occurrence of a substring
- `replaceAll`: replace all occurrences of a substring
- `split`: split a string on a given delimiter
- `join`: join a list of strings with a given delimiter

## Installation

Clone the repository and import the module in your Haskell project:

```haskell
import StringUtils
```

## Examples

### `strip`

```haskell
strip "   hello world  "
-- "hello world"
```

### `contains`

```haskell
contains "ell" "hello"
-- True
```

### `replaceFirst`

```haskell
replaceFirst "l" "L" "hello"
-- "heLlo"
```

### `replaceAll`

```haskell
replaceAll "l" "L" "hello"
-- "heLLo"
```

### `split`

```haskell
split "," "one,two,three"
-- ["one", "two", "three"]
```

### `join`

```haskell
join ", " ["one", "two", "three"]
-- "one, two, three"
```

## Comparison with Python

| Haskell Function   | Python Equivalent             |
|--------------------|-------------------------------|
| `strip`            | `"str".strip()`               |
| `contains`         | `"substr" in str`             |
| `replaceFirst`     | `"str".replace(old, new, 1)`  |
| `replaceAll`       | `"str".replace(old, new)`     |
| `split`            | `"str".split(sep)`            |
| `join`             | `"sep".join(list)`            |

## License

MIT