module ResquestsHelper
  def pluralize(count, singular, plural = nil, zero = nil)
    return zero if count == 0
    "#{count || 0} " + ((count == 1) ? singular : (plural || singular.pluralize))
  end
end
