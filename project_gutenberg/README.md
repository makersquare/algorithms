# Project Gutenberg

Build a system that will, given a book, predict which category that book is in.
The allowed categories are: astronomy, philosophy, physics, religion,
archeology.

Our algorithm will consist of two parts, training and predicting.

## Training

In training, have access to all the books in `data/training`. Look through the
data for a moment, so you get a feel of what we'll be dealing with.

We have helper methods that loads all the books and converts them to list of tokens (word).

For example, if the sentence is `Jack and Jill went up the hill`, our tokens are
`["jack", "and", "jill", "went", "up", "the", "hill"]`.

An example we've built it found in `SimplePredictor#train!`. Read through this
code and make sure you understand what's happening here.

In short, in training, we build up a data structure `@data` to be used later in
our predict step.

## Predicting

Our predictor will be a method called `predict`. It takes in a list of tokens
and returns a category. For example:

```ruby
my_predictor.predict(["jack", "and", "jill", "went", "up", "the", "hill"])
=> :nursey_rhyme
```

Read through `SimplePredictor#predict` to see how we used the `@data` built in
training to predict the category.

## Running the Program

Let's see how well our `SimplePredictor` does. Run:

    $ ruby gutenberg.rb

And you should get back something like this:

```
+----------------------------------------------------+
| SimplePredictor                                    |
+----------------------------------------------------+
Loading books...
Loading books took 7.048747 seconds.
Training...
Training took 0.000141 seconds.
Predicting...
Predictions took 3.251546 seconds.
Accuracy: 0.4
```

As you can see, our `SimplePredictor` gets 40% of its predictions correct!

## Our Algorithm

`SimplePredict` isn't very smart; we can do better. We're going to implement
`ComplexPredictor`. Now, the algorithm is really up to you. We give you a base
algorithm to use, but feel free to modify the algorithm or try an entirely new
algorithm. Or create multiple algorithms and compare them.

### Training

For our base algorithm, our training will take each category and book and count the total number of words in each category and the number of books in each category.
This creates a hash that looks like this:

```ruby
@data = {
  astronomy: {
    words: 10000,
    books: 10,
  },
  archeology: {
    words: 4000,
    books: 5,
  }
}
```

In the example above, there may be ten astronomy books and 5 archeology books
in our training set, but we add them all up.

### Predicting

Our `predict` function, then, will see what category has the closest word-to-book ratio as the book we are trying to predict.
For example, if our `training` function returned the following data:

```ruby
@data = {
  astronomy: {
    words: 10000,
    books: 10,
  },
  archeology: {
    words: 4000,
    books: 5,
  }
}
```

Then we can see that the average astronomy book has 1000 words, while the average archeology book has 800 words. If we're trying to predict the category of a book that contains 880 words, we would predict `:archology` because the book word count is closer to archeology's word count than astronomy's.

### Running ComplexPredictor

Let's see how well our `ComplexPredictor` does. Run:

    $ ruby gutenberg.rb

And you should get back something like this:

```
+----------------------------------------------------+
| ComplexPredictor                                   |
+----------------------------------------------------+
Loading books...
Loading books took 5.417863 seconds.
Training...
Training took 4.0e-06 seconds.
Predicting...
Correct! Predicted astronomy. data/test/astronomy/22157-0.txt.
Correct! Predicted astronomy. data/test/astronomy/8hsrs10u.txt.
Correct! Predicted astronomy. data/test/astronomy/pg16767.txt.
Correct! Predicted astronomy. data/test/astronomy/pg25267.txt.
Correct! Predicted astronomy. data/test/astronomy/pg27477.txt.
Correct! Predicted astronomy. data/test/astronomy/pg28570.txt.
Correct! Predicted astronomy. data/test/astronomy/pg4065.txt.
Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/11100-0.txt.
Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg13316.txt.
Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg1497.txt.
Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg16712.txt.
Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg22283.txt.
Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg5827.txt.
Wrong.   Predicted astronomy instead of religion. data/test/religion/pg15836.txt.
Wrong.   Predicted astronomy instead of religion. data/test/religion/pg21190.txt.
Wrong.   Predicted astronomy instead of religion. data/test/religion/pg7883.txt.
Wrong.   Predicted astronomy instead of religion. data/test/religion/pg8070.txt.
Wrong.   Predicted astronomy instead of religion. data/test/religion/pg8200.txt.
Wrong.   Predicted astronomy instead of archeology. data/test/archeology/22153-0.txt.
Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg13575.txt.
Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg17606.txt.
Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg17987.txt.
Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg18931.txt.
Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg19921.txt.
Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg23691.txt.
Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg4248.txt.
Accuracy: 0.2692307692307692
Predictions took 2.449978 seconds.
Accuracy: 0.2692307692307692
```

Your accuracy should be higher than 27%, as the above output is from an
algorithm that predicts only `:astronomy`.

### Let's Go

You should have enough information to get started. If you need help, please
don't hesitate to ask an instructor.

# Legal

Copyright Elben Shira
