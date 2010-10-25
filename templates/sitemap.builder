xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  ["/", "about", "/archives"].each do |page|
    xml.url do
      xml.loc @config[:url] + "#{page}"
    end
  end
  @articles.each do |article|
    xml.url do
      xml.loc article.url
    end
  end
end
