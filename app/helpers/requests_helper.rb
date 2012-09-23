module RequestsHelper
  include ActionView::Helpers::TextHelper

  alias_method :old_pluralize, :pluralize

  def count(model)
    count = model.count.to_i
    model_name = model.model_name
    model_name_plural = model_name.plural

    singular = t(:"#{model_name.singular}", scope: ["pluralize", :"#{model_name_plural}"])
    plural = t(:"#{model_name_plural}", scope: ["pluralize", :"#{model_name_plural}"])
    zero = t(:"no#{model_name_plural}", scope: ["pluralize", :"#{model_name_plural}"])

    return zero if count == 0
    old_pluralize count, singular, plural
  end
end
