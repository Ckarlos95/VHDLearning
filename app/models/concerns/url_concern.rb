module UrlConcern
  class String
    def to_url
      self.downcase.tr('àáäâãèéëẽêìíïîĩòóöôõùúüûũñç', 'aaaaaeeeeeiiiiiooooouuuuunc').tr(' ', '-')
    end
  end
end