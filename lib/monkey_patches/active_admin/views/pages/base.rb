module ActiveAdmin
  module Views
    module Pages
      class Base
        def build_active_admin_head
          within @head do
            insert_tag Arbre::HTML::Title, [title, render_or_call_method_or_proc_on(self, active_admin_namespace.site_title)].compact.join(" | ")

            text_node Gon::Base.render_data

            active_admin_application.stylesheets.each do |style, options|
              text_node stylesheet_link_tag(style, options).html_safe
            end

            active_admin_application.javascripts.each do |path|
              text_node(javascript_include_tag(path))
            end

            if active_admin_namespace.favicon
              text_node(favicon_link_tag(active_admin_namespace.favicon))
            end

            active_admin_namespace.meta_tags.each do |name, content|
              text_node(tag(:meta, name: name, content: content))
            end

            text_node csrf_meta_tag
          end
        end
      end
    end
  end
end
