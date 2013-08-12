require 'rake'
require './lib/conlang/version.rb'

Gem::Specification.new do |s|
  s.name        = 'conlang'
  s.version     = ConlangWordGenerator::VERSION
  s.summary     = "ConlangWordGenerator. A statistical random word generator for regular grammars."
  s.description = "This gem allow users to generate random words. The user must provide " +
                  "a LANG file with defined phonemes and a regular grammatical expression. " +
                  "You can learn how to create LANG files, or explore some examples, at this project's " +
                  "source repository on Github: https://github.com/fluorine/ConlangWordGenerator"
  s.authors     = ["Joseph"]
  s.email       = "fluorine@github.com"
  s.files       = FileList['lib/**/*.rb', 'bin/*', '*.md', '*.txt', 'test/**/*'].to_a
  s.executables << 'conlang'
  s.homepage    = 'https://github.com/fluorine/ConlangWordGenerator'
  s.license     = 'Apache'
  s.post_install_message = "   Go to https://github.com/fluorine/ConlangWordGenerator to learn\n" +
                           "   how to create LANG files to generate words for constructed languages."
end