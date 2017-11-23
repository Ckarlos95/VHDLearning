module TagsHelper
  def icon_string(icon_str, **opts)
    # uni_word_icons = {foundicon: :i, }
    
    return unless icon_str  # Return if nil given

    icon_words = icon_str.split
    ret = nil
    case icon_words.size
    when 1
      # When icon's class name is only one word length
    when 2
      case icon_words.first
      when :start_with?.with('material').to_proc
        # Material Icons
        ret = content_tag(:i, icon_words.last, {class: icon_words.first}.merge(opts){|key, first, second| first + " " + second })
      when :start_with?.with('fa').to_proc
        # FontAwesome Icons
        ret = content_tag(:i, nil, {class: icon_str}.merge(opts){|key, first, second| first + " " + second })
      end
    else
      # When icon's class name is more than 2 words length
    end

    ret
  end
end