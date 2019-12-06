require 'nokogiri'

# Replace the images by the webp version.
# Webp images were generated by the 'jekyll-webp' plugin (https://github.com/sverrirs/jekyll-webp)
module Jekyll
  module WebpFilter

    def webp_images(input, responsive = true, wi = nil, he = nil)
      doc = Nokogiri::HTML.fragment(input);

      # Replace all images by webp version
      doc.css('amp-img').each do |amp_img|

        fallback = amp_img.dup
        fallback['fallback'] = ''

        amp_img.add_child(fallback)
        amp_img['src'] = to_webp(amp_img['src'])

       end

      # Return the html as plaintext string
      doc.to_s
    end

    # Replace one image by webp version
    def to_webp(image_url)
        image_url.rpartition('.').first + '.webp'
    end
  end
end

Liquid::Template.register_filter(Jekyll::WebpFilter)