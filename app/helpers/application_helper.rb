module ApplicationHelper

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
