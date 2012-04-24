module SharesHelper
  def custom_or_default_description(custom)
    if @share.description.empty?
      custom
    else
      @share.description
    end
  end
end
