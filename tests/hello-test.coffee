

describe "The examples", ->
  describe "The hello example", ->
    before ->
      casper.start "http://hello.derbyjs.com:3000/"
      
    it "should have a title", ->
      casper.then ->
        "Derby App".should.matchTitle

    it "update with text", ->
      casper.then ->
        txt = "foobar" + Math.random()
        @fillSelectors "body", input: txt
        "h2".should.have.text new RegExp txt

        txt = "baz" + Math.random()
        @fillSelectors "body", input: txt
        "h2".should.have.text new RegExp txt


  describe "The chat example", ->
    before ->
      casper.start "http://chat.derbyjs.com:3000/"
      
    it "should have a title", ->
      casper.then ->
        /Chat/.should.matchTitle

    it "update with a comment", ->
      casper.then ->
        txt = "baz" + Math.random()
        @fillSelectors "body", "#inputs-comment": txt
        @sendKeys "#inputs-comment", casper.page.event.key.Enter, keepFocus: true
        ".message p:nth-child(3)".should.have.text new RegExp txt


  describe "The directory example", ->
    before ->
      casper.start "http://directory.derbyjs.com:3000/"
      
    it "should have a title", ->
      casper.then ->
        "Company directory".should.matchTitle


  describe "The todos example", ->
    before ->
      casper.start "http://todos.derbyjs.com:3000/"
      
    it "should have a title", ->
      casper.then ->
        "Todos".should.matchTitle


  describe "The widgets example", ->
    before ->
      casper.start "http://widgets.derbyjs.com:3000/"
      
    it "should have a title", ->
      casper.then ->
        "Widgets".should.matchTitle


  describe "The codemirror example", ->
    before ->
      casper.start "http://codemirror.derbyjs.com:3000/"
      
    it "should have a title", ->
      casper.then ->
        "Codemirror".should.matchTitle
    