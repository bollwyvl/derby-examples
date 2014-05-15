# TODO: make this configurable?
url = (example) -> "http://#{example}.derbyjs.com:3000/"

count = (selector) ->
  _ = (selector) -> document.querySelectorAll(".message").length
  casper.evaluate _, selector


describe "The example", ->
  afterEach (done) ->
    casper.then ->
      @debugHTML "body"
      done()

  describe "hello", ->
    before -> casper.start url "hello"
      
    it "should have a title", (done) ->
      casper.then ->
        "Derby App".should.matchTitle
        done()
    
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


  describe "chat", ->
    before -> casper.start url "chat"
      
    it "should have a title", (done) ->
      casper.then ->
        /Chat/.should.matchTitle
        done()

    it "update with a comment", (done) ->
      casper.then ->
        txt = "baz" + Math.random()
        
        num_chats = count ".message"
        
        check = -> count(".message") > num_chats
        
        casper.waitFor check, ->
          ".message p:nth-child(3)".should.have.text new RegExp txt
          done()
        
        @fillSelectors "body", "#inputs-comment": txt
        @sendKeys "#inputs-comment",
          casper.page.event.key.Enter
          keepFocus: true


  describe "directory", ->
    before -> casper.start url "directory"
      
    it "should have a title", (done) ->
      casper.then ->
        "Company directory".should.matchTitle
        done()


  describe "todos", ->
    before -> casper.start url "todos"
      
    it "should have a title", (done) ->
      casper.then ->
        "Todos".should.matchTitle
        done()


  describe "widgets", ->
    before -> casper.start url "widgets"
      
    it "should have a title", (done) ->
      casper.then ->
        "Widgets".should.matchTitle
        done()


  describe "codemirror", ->
    before -> casper.start url "codemirror"
      
    it "should have a title", (done) ->
      casper.then ->
        "Codemirror".should.matchTitle
        done()
    