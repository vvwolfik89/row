module ApplicationHelper

# Creates a dropdown menu with items matching Refinery pages
# and tags/css matching Foundation markup
#
# Options:
# * *:menu_tag* - A wrapper for the lists
# * *:dom_id* - The dom id for the wrapper
# * *:css* - The css class for the wrapper
# * *:list_dropdown_css* - The css class of the submenu list
# * *:list_item_dropdown_css* - The css class of the main menu item that has a dropdown
# * *:list_tag_css* - The css class of the main menu
# * *:active_css* - The css class denoting a active menu item
# * *:selected_css* - The css class denoting a current menu item

  def foundation_menu(items, options = {})
    presenter = Refinery::Pages::FoundationMenuPresenter.new(items, self)
    %w(menu_tag dom_id css list_dropdown_css list_item_dropdown_css list_tag_css active_css selected_css).map(&:to_sym).each do |k|
      presenter.send("#{k}=", options[k]) if options.has_key?(k)
    end
    presenter
  end

  def custom_form_for(object, *args, &block)
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(builder: CustomFormBuilder)), &block)
  end

  def bootstrap3_form_options(options = {})
    {
      html: {class: "form-horizontal #{options[:html_class]}"}.merge(options[:html] || {}),
      wrapper: options[:wrapper] || :horizontal_form,
      wrapper_mappings: {
        check_boxes: :horizontal_radio_and_checkboxes,
        radio_buttons: :horizontal_radio_and_checkboxes,
        file: :horizontal_file_input,
        boolean: :horizontal_boolean,
        ckeditor: :vertical_file_input
      }
    }
  end

  def footer_menu
    menu_items = Refinery::Menu.new(Refinery::Page.footer_menu_pages)

    Refinery::Pages::MenuPresenter.new(menu_items, self).tap do |presenter|
      presenter.dom_id = "footer_menu"
      presenter.css = "footer_menu"
      presenter.menu_tag = :div
      presenter.list_tag_css = 'link_tag_css1'
    end
  end
end
