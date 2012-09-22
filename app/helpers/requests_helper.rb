module RequestsHelper
  include ActionView::Helpers::TextHelper

  alias_method :old_pluralize, :pluralize

  def pluralize(count, singular, plural = nil, zero = nil)
    return zero if count == 0
    old_pluralize count, singular, plural
  end
end
