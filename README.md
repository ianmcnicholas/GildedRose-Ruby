# Gilded Rose Tech Test #

### The outline of this tech test can be found [here](https://github.com/makersacademy/course/blob/master/individual_challenges/gilded_rose.md).

## How to run this program ##

Clone this repository into your local directory:
```
git clone https://github.com/ianmcnicholas/GildedRose-Ruby.git
```
Navigate into the project directory:
```
cd GildedRose-Ruby
```
View the code tests:
```
rspec
```
View the texttest_fixture file in action:
```
ruby lib/texttest_fixture.rb
```

## Approach ##

I began this test by trying to interact with the existing program as I normally would with Ruby files.  I found that the file structure was not working, so I created a `spec` and `lib` directory into which I placed the testing files and code files respectively.

Once I had edited the files to suit this new file structure, I could run RSPEC.

I then wrote unit tests to cover the test specifications e.g. "Aged Brie" increases in quality with age, regular items decrease in quality.  I did this so that my refactoring of the `update_quality()` method would not break the program.

Then, when I was content with my refactoring, I added unit tests to allow for code to deal with "Conjured" items, and then the subsequent code for this.

Finally, to implement some form of feature test, I redirected the file `texttest_fixture.rb` which can be run directly in the terminal to show example outputs of the project.
