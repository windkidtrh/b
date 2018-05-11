module ApplicationHelper
    # 根据所在的页面返回完整的标题
    def full_title(page_title = '')
        base_title = "石化腐蚀数据管理分析系统"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
    
end
