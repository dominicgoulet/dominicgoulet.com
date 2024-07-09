# frozen_string_literal: true

module AdminHelper
  class MenuItem
    attr_accessor :name, :path, :controller

    def initialize(name:, path:, controller:)
      @name = name
      @path = path
      @controller = controller
    end
  end

  def admin_menu_items
    [
      MenuItem.new(name: "Dashboard", path: admin_dashboard_path, controller: "admin/dashboard"),
      MenuItem.new(name: "Articles", path: admin_articles_path, controller: "admin/articles"),
      MenuItem.new(name: "Labels", path: admin_labels_path, controller: "admin/labels"),
      MenuItem.new(name: "Social Links", path: admin_social_links_path, controller: "admin/social_links")
    ]
  end

  def admin_menu_item_class(path)
    if current_page?(path)
      "bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium"
    else
      "text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium"
    end
  end

  def active_admin_menu_item
    admin_menu_items.find { |menu_item| menu_item.controller == params[:controller] || menu_item.path == request.path }
  end
end
