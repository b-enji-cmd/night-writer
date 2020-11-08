class TranslatorToEnglish < TranslatorEngine
  def initialize
    super
    @data = load_data
  end

  def hash_swap
    @dictionary.invert
  end

end