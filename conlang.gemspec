require 'rake'

Gem::Specification.new do |s|
  s.name        = 'conlang'
  s.version     = '0.2.0'
  s.date        = '2013-06-06'
  s.summary     = "Full name: ConlangWordGenerator. A statistical random words generator for constructed languages."
  s.description = "This gem takes constructed grammar and phonemes from a LANG file to generate random words. " +
                  "You can learn how to create LANG files, or explore some sample files, at this project's " +
                  "source repository on Github: https://github.com/fluorine/ConlangWordGenerator"
  s.authors     = ["Joseph"]
  s.email       = "fluorine@github.com"
  s.files       = FileList['lib/**/*.rb', 'bin/*', '*.md', '*.txt', 'test/**/*'].to_a
  s.homepage    = 'https://github.com/fluorine/ConlangWordGenerator'
  s.license     = 'Apache'
  s.post_install_message = "  Go to https://github.com/fluorine/ConlangWordGenerator to learn\n" +
                           "  how to create LANG files to generate words for constructed languages."
end