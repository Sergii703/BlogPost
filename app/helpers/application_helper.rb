module ApplicationHelper
  def build_breadcrumb(category)
    result = []
     category.ancestors.each do |ancestor|
       result << content_tag(:li, class: "breadcrumb_item") do
         link_to(ancestor.name, ancestor)
       end
     end
     result << content_tag(:li, category.name, class: "breadcrumb_item active")
     result.join('').html_safe
  end
end
