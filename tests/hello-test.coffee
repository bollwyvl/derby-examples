describe "The hello example", ->
  before ->
    casper.start "http://hello.derbyjs.com:3000/"
    
  it "should have a title", ->
    casper.then ->
      "Derby App".should.matchTitle

  it "update with text", ->
    casper.then ->
      @fillSelectors "body", input: "foobar"
      "h2".should.have.text /foobar/
      @fillSelectors "body", input: "baz"
      "h2".should.have.text /baz/