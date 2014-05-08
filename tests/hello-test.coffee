url = (example) ->
  "http://#{example}.derbyjs.com:3000/"
  
visit = (example) ->
  before -> casper.start url example

describe "The examples", ->
  describe "The hello example", ->
    before ->
      casper.start "http://hello.derbyjs.com:3000/"
      
    it "should have a title", ->
      casper.then ->
        "Derby App".should.matchTitle

    it "update with text", (done) ->
      casper.then ->
        txt = "foobar" + Math.random()
        casper.waitForSelectorTextChange "h2", ->
          "h2".should.have.text new RegExp txt
        
          txt = "baz" + Math.random()
          casper.waitForSelectorTextChange "h2", ->
            "h2".should.have.text new RegExp txt
            done()
          @fillSelectors "body", input: txt
        @fillSelectors "body", input: txt


  describe "The chat example", ->
    visit "chat"
      
    it "should have a title", ->
      casper.then ->
        /Chat/.should.matchTitle

    it "update with a comment", ->
      casper.then ->
        txt = "baz" + Math.random()
        @fillSelectors "body", "#inputs-comment": txt
        @sendKeys "#inputs-comment",
          casper.page.event.key.Enter,
          keepFocus: true
        ".message p:nth-child(3)".should.have.text new RegExp txt


  describe "The directory example", ->
    visit "directory"
      
    it "should have a title", ->
      casper.then ->
        "Company directory".should.matchTitle


  describe "The todos example", ->
    visit "todos"
      
    it "should have a title", ->
      casper.then ->
        "Todos".should.matchTitle


  describe "The widgets example", ->
    visit "widgets"
      
    it "should have a title", ->
      casper.then ->
        "Widgets".should.matchTitle


  describe "The codemirror example", ->
    visit "codemirror"
      
    it "should have a title", ->
      casper.then ->
        "Codemirror".should.matchTitle
    