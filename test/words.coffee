do (require "source-map-support").install

should  = require "should"
words   = require "../"

describe "words function", ->
  it "has re property", ->
    words.should.have.property "re"

  it "has re property that is instance of RegExp", ->
    words.re.should.be.an.instanceOf RegExp

  it "splits english text into words", ->
    words("Hello. I am mr Words. How are you?").should.eql [
      "Hello"
      "I"
      "am"
      "mr"
      "Words"
      "How"
      "are"
      "you"
    ]
  
  it "splits polish text into words", ->
    words("Mała Katiusza urosła duża, spostrzegła Średnią Łasicę i czmychnęła do dziury.").should.eql [
      "Mała"
      "Katiusza"
      "urosła"
      "duża"
      "spostrzegła"
      "Średnią"
      "Łasicę"
      "i"
      "czmychnęła"
      "do"
      "dziury"
    ]
  
  it "can use prefix option", ->
    words(prefix: "@", "@max said to @tommy: go ahead!").should.eql [
      "@max"
      "@tommy"
    ]
  
  it "can use prefix and postfix options", ->
    words(prefix: "<", postfix: ">", "It was published on 2013-12-20 in <Warsaw>.").should.eql ["<Warsaw>"]

  it "prefix and postfix options can be REs", ->
    words(prefix: /(?!<)/, postfix: /(?=>)/, "It was <published> on 2013-12-20 in <Warsaw>.").should.eql [
      "published"
      "Warsaw"
    ]

  it "returns null if no text provided", ->
    should.not.exist words()

  it "returns null if empty text provided", ->
    should.not.exist words "         "

