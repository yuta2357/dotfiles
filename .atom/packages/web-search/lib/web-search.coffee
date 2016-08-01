WebSearchListView = require './web-search-list-view'
WebSearchBrowserView = require "./web-search-browser-view"
{CompositeDisposable} = require 'atom'

module.exports = WebSearch =
  WebSearchListView: null
  WebSearchBrowserView: null
  modalPanel: null
  browserPanel: null
  subscriptions: null
  # http://superuser.com/questions/206229/how-to-make-a-blank-page-in-google-chrome-at-start-up
  newPage: "chrome://newtab"

  # config:
  #   browser:
  #     type: "object"
  #     properties:
  #       position:
  #         default: "right"
  #         type: "string"
  #         enum: ["top", "right", "bottom", "left"]
  #       size:
  #         type: "integer"
  #         default: 450
  #       useragent:
  #         type: "string"
  #         description: "default is iOS9 for iPhone."
  #         default: "Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344 Safari/601.1"
  #       styles:
  #         type: "string"
  #         description: "Additional styles."
  #         # http://www.dtp-transit.jp/misc/web/post_1881.html
  #         default: "*{font-family: Verdana, \"游ゴシック\", YuGothic, \"ヒラギノ角ゴ ProN W3\", \"Hiragino Kaku Gothic ProN\", \"メイリオ\", Meiryo, sans-serif !important;}"
  #   webservice:
  #     type: "array"
  #     default: ["http://google.com/search?q=$q$","http://wikipedia.org/wiki/$q$"]

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'web-search:search': => @openPanel()

    atom.config.onDidChange 'web-search.browser.position', () => @browserPanelRefresh()
    atom.config.onDidChange 'web-search.browser.size', () => @browserPanelRefresh()
    atom.config.onDidChange 'web-search.browser.useragent', () => @browserPanelRefresh()

  openPanel: ->
    e = atom.workspace.getActiveTextEditor()
    return unless e?
    @browserHide()
    if @WebSearchListView is null
      @WebSearchListView = new WebSearchListView(this)
    @modalPanel ?= atom.workspace.addModalPanel(item: @WebSearchListView)
    @modalPanel.show()
    @WebSearchListView.focusFilterEditor()
    @WebSearchListView.setItems atom.config.get("web-search.webservice")

  search: (webservice)->
    @panelHide()
    e = atom.workspace.getActiveTextEditor()
    return unless e?
    text = if e.getSelectedText().length > 0 then e.getSelectedText() else "atom-web-search"

    if @browserPanel is null
      @addWebview(webservice, text)

    else
      @webSearchBrowserView.setURL(@newPage)
      setTimeout ( => @browserPanel.show()), 100
      setTimeout =>
        @webSearchBrowserView.setURL(webservice.replace("$q$", encodeURIComponent(text)))
      , 100

  browserPanelRefresh: () ->
    @browserHide()
    @browserPanel.destroy()
    @browserPanel = null


  addWebview: (webservice, text) ->
    position = atom.config.get("web-search.browser.position")
    params = {
      url: webservice.replace("$q$", encodeURIComponent(text)),
      size: atom.config.get("web-search.browser.size"),
      useragent: atom.config.get("web-search.browser.useragent"),
      position: position
    }

    @webSearchBrowserView = new WebSearchBrowserView(params, this)
    @browserPanel = switch position
      when "top"    then atom.workspace.addTopPanel(item: @webSearchBrowserView)
      when "right"  then atom.workspace.addRightPanel(item: @webSearchBrowserView)
      when "bottom" then atom.workspace.addBottomPanel(item: @webSearchBrowserView)
      when "left"   then atom.workspace.addLeftPanel(item: @webSearchBrowserView)

    # http://qiita.com/from_kyushu/items/3f818a80ba7e58d356dc
    @browserPanel.item.webview.on "dom-ready", ->
      this.insertCSS atom.config.get("web-search.browser.styles")

  deactivate: ->
    @modalPanel.destroy()
    @browserPanel.destroy()
    @subscriptions.dispose()
    @WebSearchListView.destroy()
    @webSearchBrowserView.destroy()

  panelHide: ->
    @modalPanel?.hide()

  browserHide: ->
    @browserPanel?.hide()
