module ViewHelpers
  def link_to(url, link)
    capture_haml do
      haml_tag :a, :<, :>, href: url do
        haml_concat link
      end
    end.strip
  end 

  def image_tag(name)
    capture_haml do
      haml_tag :img, :/, src: "/images/#{name}", alt: name
    end.strip
  end 

  def social_tag(icon, link)
    capture_haml do
      haml_tag :li, :<, :> do
        haml_tag :a, :<, :>, href: link do
          haml_tag :img, :<, :>, :/, src: "/images/social/#{icon}.png", alt: icon
        end
      end
    end.strip
  end

  def project_tag(project, image, url)
    capture_haml do
      haml_tag 'li.project' do
        haml_tag 'a.photo', :<, :>, href: url do
          haml_tag :img, src: image
        end
        haml_tag 'a.caption', :<, :>, href: url do
          haml_concat project
        end
      end
    end.strip
  end
end

if %x(which haml).strip == $0
  include ::ViewHelpers
end
