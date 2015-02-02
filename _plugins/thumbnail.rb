class Jekyll::ImagePreview < Liquid::Tag

  def initialize(tag_name, url, tokens)
  	super
  	@url = url.strip
  end

  def render(context)
  	base_url = Jekyll.configuration({})['baseurl']
  	thumb_name = @url.sub('.jpg','-thumb.jpg')
  	
    <<-MARKUP.strip
    <a href="#{base_url}/#{@url}" target="_blank"><img src="#{base_url}/#{thumb_name}" /></a>
    MARKUP
  end
end


Liquid::Template.register_tag('preview',   Jekyll::ImagePreview)

