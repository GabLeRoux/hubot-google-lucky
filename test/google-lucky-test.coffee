chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'google-lucky', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/google-lucky')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(((luck|lucky)( me)?)|(feeling lucky for)) (.*)/i)

  url = "http://example.com"

  it "#{url} should startsWith http", ->
    expect(url.startsWith("http")).to.be.true

  it "#{url} shouldn\'t startsWith ftp", ->
    expect(url.startsWith("ftp")).to.be.false
