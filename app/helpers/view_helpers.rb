class NickBarthCa < Sinatra::Base
  helpers do
    def link_to(text, url)
      "<a href='#{url}'>#{text}</a>"
    end 

    def image_tag(name)
      "<img src='/images/#{name}' alt='#{name}' />"
    end 

    def social_tag(icon, link)
      Haml::Engine.new(
        "%li<\n" + 
        "  %a{ href: '#{link}' }<\n" + 
        "    %img{ src: '/images/social/#{icon}.png', alt: '#{icon}' }\n",
        { format: :html5, ugly: true }
      ).render
    end

    def project_tag(project, image, url)
      Haml::Engine.new(
        ".project\n" +
        "  %a.photo{ href: '#{url}' }\n" +
        "    %img{ src: '#{image}'}\n" +
        "  %a.caption{ href: '#{url}' } #{project}\n",
        { format: :html5, ugly: true }
      ).render
    end
  end
end
