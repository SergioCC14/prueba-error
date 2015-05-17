def string_to_slug(str)
  # .gsub(/[^0-9a-z]/, ' ')
  # return str.downcase.gsub('á', 'a').gsub('é', 'e').gsub('í', 'i').gsub('ó', 'o').gsub('ú', 'u').gsub('à', 'a').gsub('è', 'e').gsub('ì', 'i').gsub('ò', 'o').gsub('ù', 'u').gsub('ñ', 'n').gsub('ç', 'c').gsub('/', ' ').gsub('.', ' ').gsub(',', ' ').gsub(':', ' ').squish.gsub(' ', '-').to_s
  # return str.downcase.gsub('á', 'a').gsub('é', 'e').gsub('í', 'i').gsub('ó', 'o').gsub('ú', 'u').gsub('à', 'a').gsub('è', 'e').gsub('ì', 'i').gsub('ò', 'o').gsub('ù', 'u').gsub('ñ', 'n').gsub('ç', 'c').to_ascii.downcase.gsub(/[^a-z0-9 ]/, ' ').strip.gsub(/[ ]+/, '-')
  return str.gsub(/[-‐‒–—―⁃−­]/, '-').to_ascii({'ñ' => 'ñ', 'Ñ' => 'Ñ'}).downcase.gsub(/[^a-zñ0-9 ]/, ' ').strip.gsub(/[ ]+/, '-')
end