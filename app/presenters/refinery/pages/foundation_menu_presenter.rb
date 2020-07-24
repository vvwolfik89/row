require 'active_support/core_ext/string'
require 'active_support/configurable'
require 'action_view/helpers/tag_helper'
require 'action_view/helpers/url_helper'

module Refinery
  module Pages
    class FoundationMenuPresenter < MenuPresenter

      config_accessor :list_dropdown_css, :list_item_dropdown_css, :list_tag_css, :menu_tag, :dom_id, :css, :list_tag,
                      :list_item_tag, :active_css, :selected_css, :list_tag_css, :list_item_tag_css

      self.list_dropdown_css = 'dropdown-menu'
      self.list_item_dropdown_css = 'nav-item submenu dropdown'
      self.dom_id = 'navbarSupportedContent'
      self.css = 'collapse navbar-collapse offset'
      self.list_item_tag_css = 'nav_item menu_item'
      self.menu_tag = :div
      self.list_tag = :ul
      self.list_item_tag = :li
      self.active_css = :active
      self.selected_css = :selected
      self.link_tag_css = 'nav-link'
      self.last_css = nil
      self.first_css = nil

      private

      def render_menu(items)
        if menu_tag
          content_tag(menu_tag, :id => dom_id, :class => css) do
            render_menu_items(items)
          end
        else
          render_menu_items(items)
        end
      end

      def render_menu_items(menu_items)
        return if menu_items.blank?
        content_tag(list_tag, :class => menu_items_css(menu_items)) do
          menu_items.each_with_index.inject(ActiveSupport::SafeBuffer.new) do
          |buffer, (item, index)|
            buffer << render_menu_item(item, index)
          end
        end
      end

      def check_for_dropdown_item(menu_item)
        # ( menu_item != roots.first ) && (  )
        menu_item_children(menu_item).count > 0
      end

      def menu_items_css(menu_items)
        css = []

        if roots == menu_items
          css << list_tag_css
        else
          css << list_dropdown_css
        end

        css.reject(&:blank?).presence
      end

      def menu_item_css(menu_item, index)
        css = []

        css << active_css if descendant_item_selected?(menu_item)
        css << selected_css if selected_item?(menu_item)
        css << list_item_dropdown_css if check_for_dropdown_item(menu_item)
        css << first_css if index == 0
        css << list_item_tag_css
        css << last_css if index == menu_item.shown_siblings.length

        css.reject(&:blank?).presence
      end

      def render_menu_item(menu_item, index)
        content_tag(list_item_tag, :class => menu_item_css(menu_item,
                                                           index)) do
          @cont = context.refinery.url_for(menu_item.url)
          buffer = ActiveSupport::SafeBuffer.new
          buffer << link_to(menu_item.title, context.refinery.url_for(menu_item.url))
          buffer << render_menu_items(menu_item_children(menu_item))
          buffer
        end
      end

    end
  end
end