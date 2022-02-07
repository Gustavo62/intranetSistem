module ApplicationHelper  
    def icon(icon, options = {})
        file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
        doc = Nokogiri::HTML::DocumentFragment.parse file
        svg = doc.at_css 'svg'
        if options[:class].present?
        svg['class'] += " " + options[:class]
        end
        doc.to_html.html_safe
    end 
    def active_link_to(name = nil, options = nil, html_options = nil, &block)
        active_class = html_options[:active] || "active"
        html_options.delete(:active)
        html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
        link_to(name, options, html_options, &block)
    end
    def first_name(name)
      if name.split.count > 1
        name.split[0..1].join(' ')
      else
        name
      end
    end
end
