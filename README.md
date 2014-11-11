# Autocomplete

We will build an autocomplete plugin by implementing a trie.

# Implement

## Trie

Implement the following methods in `Trie`:

`includes(substring, Node)` returns true if the given substring is in the trie starting from the given `node`. Otherwise, returns false.

`iterate(Node)` returns all the strings that can be built from this node. NOTE: does not necessarilly have to be a word:

Example: If we've added the words dog, dot into the Trie, and do `iterate(Trie.getChild('d').getChild('o'))` should return `['og','ot']`

`insert(string)` inserts the string into the Trie.

`search(prefix)` Should search the Trie for all possible strings using that prefix:

- `search('do')` should return `["dog", "dot", "do"]`
- `search('')` should return `["dog", "dot", "do", "dad", "bird"]`

`findLastNode(string)` Return the last node that exists in the Trie based on the string. *Assuming our Trie has 'dog' and 'dot' in it:*

- `findLastNode()` Should return `Trie.root`
- `findLastNode("")` Should return `Trie.root`
- `findLastNode("xyz")` Should return `null`
- `findLastNode("do")` Should equal `Node` that has the 'o' character

## Node

`add(character)` Adds a node to this Node with it's value being equal to the character

`getChild('character')` Finds a direct child in this node where it's value is equal to the `character` being looked for. Returns a Node.

# Run

Open `index.html` to run the autocomplete plugin.

# Tests

Run tests by opening `SpecRunner.html`. In this file you can also view more in details what is expected for each method to recieve and/or return.
