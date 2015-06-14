# DocPad Configuration File
# http://docpad.org/docs/config

cheerio = require('cheerio')
url = require('url')

# Define the DocPad Configuration
docpadConfig = {
  templateData:
  # Specify some site properties
    site:
    # The production url of our website
      url: "https://www.jptacek.com"

    # The default title of our website
      title: "JPtacek.com | Musings on code and who knows what 3ls3"

    # The website author's name
      author: "John Ptacek"

    # The website author's email
      email: "jptacek@gmail.com"

    # cache-busting timestamp
      timestamp: new Date().getTime()


  # -----------------------------
  # Helper Functions

  # Get the prepared site/document title
  # Often we would like to specify particular formatting to our page's title
  # we can apply that formatting here

    getPreparedTitle: ->
      # if we have a document title, then we should use that and suffix the site's title onto it
      if @document.title
        "#{@document.title} - #{@site.title}"
        # if our document does not have it's own title, then we should just use the site's title
      else
        @site.title

    getPageUrlWithHostname: ->
      "#{@site.url}#{@document.url}"

    getIdForDocument: (document) ->
      hostname = url.parse(@site.url).hostname
      date = document.date.toISOString().split('T')[0]
      path = document.url
      "tag:#{hostname},#{date},#{path}"

    getOldUrl: (newUrl) ->
      newUrl.substr(0,newUrl.length-1) + '.html'

    fixLinks: (content, baseUrlOverride) ->
      baseUrl = @site.url
      if baseUrlOverride
        baseUrl = baseUrlOverride
      regex = /^(http|https|ftp|mailto):/

      $ = cheerio.load(content)
      $('img').each ->
        $img = $(@)
        src = $img.attr('src')
        $img.attr('src', baseUrl + src) unless regex.test(src)
      $('a').each ->
        $a = $(@)
        href = $a.attr('href')
        $a.attr('href', baseUrl + href) unless regex.test(href)
      $.html()


    moment: require('moment')


    getJavascriptEncodedTitle: (title) ->
      title.replace("'", "\\'")

  # Discus.com settings
    disqusShortName: 'jptacek'

  # Google+ settings
    googlePlusId: '+JohnPtacek'

    getTagUrl: (tag) ->
      slug = tag.toLowerCase().replace(/[^a-z0-9]/g, '-').replace(/-+/g, '-').replace(/^-|-$/g, '')
      "/tags/#{slug}/"

  collections:
    posts: ->
      @getCollection("html").findAllLive({layout: 'post'},[{date:-1}])
    menuPages: ->
      @getCollection("html").findAllLive({menu: $exists: true},[{menuOrder:1}])

    cleanurls: ->
      @getCollection('html').findAllLive(skipCleanUrls: $ne: true)
#docpad -e static generate
  environments:
    static:
      outPath: '../ghpages'
      collections:   posts: ->
        @getCollection("html").findAllLive({layout: 'post'},[{date:-1}])
    development:
      outPath: '.out'
      collections:
        posts: ->
          @getCollection('documents').findAllLive({layout: {'$in' : ['post', 'drafts']}}, [layout: 1,  date: -1])

  watchOptions:
    interval: 2007
    preferredMethods: ['watchFile','watch']

  plugins:
    tags:
      findCollectionName: 'posts'
      extension: '.html'
      injectDocumentHelper: (document) ->
        document.setMeta(
          layout: 'tags'
        )

    paged:
      cleanurl: true
      startingPageNumber: 2
    cleanurls:
      trailingSlashes: true
      collectionName: 'cleanurls'
}

# Export the DocPad Configuration
module.exports = docpadConfig