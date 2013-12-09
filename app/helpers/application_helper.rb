module ApplicationHelper
    def full_title(page_title)
        base_title = "团队协作工具"
        if page_title.empty?
            base_title
        else
            "#{base_title} | #{page_title}"
        end
    end
end
