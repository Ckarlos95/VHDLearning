module ApplicationHelper
  # def controller_stylesheet(controller, opts: { media: :all })
  def controller_stylesheet(opts: { media: 'all' })
    controller_and_action = "#{controller.controller_name}/#{controller.action_name}.css"
    only_controller = "#{controller.controller_name}.css"

    if VHDLearning::Application.assets.find_asset(controller_and_action)
      return stylesheet_link_tag(controller_and_action, opts)
    elsif VHDLearning::Application.assets.find_asset(only_controller)
      return stylesheet_link_tag(only_controller, opts)
    end

    nil
  end

  # def controller_javascript(controller, opts: { media: :all })
  def controller_javascript(opts: {})
    controller_and_action = "#{controller.controller_name}/#{controller.action_name}.js"
    only_controller = "#{controller.controller_name}.js"

    if VHDLearning::Application.assets.find_asset(controller_and_action)
      return javascript_include_tag(controller_and_action, opts)
    elsif VHDLearning::Application.assets.find_asset(only_controller)
      return javascript_include_tag(only_controller, opts)
    end

    nil
  end
end
