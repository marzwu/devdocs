module Docs
  class ActionScript < UrlScraper
    self.name = 'ActionScript 3.0'
    self.slug = 'actionscript_3.0'
    self.type = 'action_script'
    self.version = '3.0'
    self.base_url = "http://help.adobe.com/zh_CN/FlashPlatform/reference/actionscript/3/"

    html_filters.push 'action_script/clean_html', 'action_script/entries', 'title'
    text_filters.push 'action_script/clean_urls'

    options[:title] = false
    options[:root_title] = 'ActionScript 3.0'

    options[:fix_urls] = ->(url) do
      url.sub! '/partials/api/api/', '/partials/api/'
      url.sub! %r{/api/(.+?)/api/}, '/api/'
      url.sub! %r{/partials/api/(.+?)(?<!\.html)(?:\z|(#.*))}, '/partials/api/\1.html\2'
      url
    end

    options[:skip] = %w(ng.html)

    options[:attribution] = <<-HTML
      &copy; 2010&ndash;2015 Adobe Systems Incorporated.<br>
      Licensed under the Creative Commons Attribution License 3.0.
    HTML

  end
end
