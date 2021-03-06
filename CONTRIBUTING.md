# Contributing

We love pull requests. Here's a quick guide:

1. Fork the repo.

2. Create your feature branch (`git checkout -b my-new-feature`)

3. Run the tests. We only take pull requests with passing tests, and it's great
to know that you have a clean slate: `bundle && rake`

4. Add a test for your change. Only refactoring and documentation changes
require no new tests. If you are adding functionality or fixing a bug, we need
a test!

5. Make the test pass.

6. Update [CHANGELOG.md](https://github.com/BoletoSimples/omniauth-boletosimples/blob/master/CHANGELOG.md) with a brief description of your changes under the `unreleased` heading.

7. Commit your changes (`git commit -am 'Added some feature'`)

8. Push to the branch (`git push origin my-new-feature`)

9. Create new Pull Request

At this point you're waiting on us. We like to at least comment on, if not
accept, pull requests within three business days (and, typically, one business
day). We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted,
taken straight from the Ruby on Rails guide:

* Use Rails idioms and helpers
* Include tests that fail without your code, and pass with it
* Update the documentation, the surrounding one, examples elsewhere, guides,
  whatever is affected by your contribution

Syntax:

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer &&/|| over and/or.
* my_method(my_arg) not my_method( my_arg ) or my_method my_arg.
* a = b and not a=b.
* Follow the conventions you see used in the source already.

And in case we didn't emphasize it enough: we love tests!