#encoding: UTF-8

xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "FREDYANG的博客"
    xml.description "关于互联网、产品、开发和相关思想的记录"
    xml.link root_url

    for article in @articles
      xml.item do
        xml.title article.title
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link article_url(article)
        xml.guid article.id

	xml.description article.content
	
      end
    end
  end
end