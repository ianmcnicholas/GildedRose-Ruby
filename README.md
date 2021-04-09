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

To implement some form of feature test, I redirected the file `texttest_fixture.rb` which can be run directly in the terminal to show example outputs of the project.

Finally, I have extracted the `update_quality()` logic into separate classes depending on the item.

## Concerns ##

From what I could gather, the brief for this test was to refactor the `update_quality()` method, in order to easily add code that dealt with "Conjured" items, and then add this code.  I feel I have certainly achieved this.

However, I am unsure if I have taken a "professional" and / or "best-practice" approach.  I rearranged the file structure to suit my needs, and have done nothing with the `gilded_rose_tests.rb` file.

I also struggled to provide adequate testing for this program.  I could not figure out how to adequately mock other classes, so would greatly appreciate feedback on this.
